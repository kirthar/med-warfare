class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :type, :unit_images_attributes, :user

  validates_presence_of :name, :type, :user

  CLASSES = %w{Archer Mage Rogue Knight Priest}

  EXP_PER_KILL = 0.1

  BASE_DMG = 10
  MAGIC_DMG = 20

  # Damage Types
  # Physical
  DMG_TYPE_PHYSICAL = 0
  DMG_TYPE_MAGICAL  = 1
  DMG_TYPE_HEALING  = 2

  DMG_TYPE_SLASHING = 10
  DMG_TYPE_PIERCING = 20
  DMG_TYPE_CRUSHING = 30

  # Magic
  DMG_TYPE_MAGIC = 11
  DMG_TYPE_FIRE  = 21
  DMG_TYPE_ICE   = 31
  DMG_TYPE_EARTH = 41
  DMG_TYPE_WIND  = 51

  DMG_TYPE_HEAL       = 12
  DMG_TYPE_RESURRECT  = 22

  belongs_to :user
  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  scope :by_type, lambda {|name| where(type: name) }

  def default_image
    if unit_images.any?
      unit_images.first.image
    else
      #type.demodulize.downcase + '.jpg'
      nil
    end

  end

  def default_dmg_type
    self.class::DMG_TYPE_SLASHING
  end

  def base_dmg
    self.class::BASE_DMG
  end
  def magic_dmg
    self.class::MAGIC_DMG
  end

  def use_skill(skill_name, target)
    result = ('skills::'+skill_name.capitalize).classify.constantize.skill(self, target)
    result.merge(action: skill_name)
  end

  def can_target_skill?(skill_name, target)
    skill = ('skills::'+skill_name.capitalize).classify.constantize

    return skill.can_target_self? if target == self

    valid = true
    valid = valid &&  if user.units.include?(target)
                        skill.friendly_fire?
                      else
                        skill.enemy_fire?
                      end

    valid && skill.valid_target?(target)
  end

  def skills
    ['basic_attack', 'defend']
  end

  def dead?
    current_health <= 0
  end

  def alive?
    not dead?
  end

  def do_damage_to(target, amount, dmg_type=DMG_TYPE_SLASHING)
    amount = -1 * amount if is_healing?(dmg_type)

    target.receive_damage(amount)

    if target.dead?
      earn_experience(target.experience * EXP_PER_KILL)
    end

    unit = {
      unit: {
        id: id,
        name: name
      }
    }

    if is_healing?(dmg_type)
      heal = {
        heal: {
          amount: amount
        }
      }
      heal[:heal] = heal[:heal].merge({resurrect: true}) if dmg_type == DMG_TYPE_RESURRECT
    else
      damage = {
        damage: {
          type: dmg_type,
          amount: amount
        }
      }
    end

    target_hash = {
      target: {
        id: target.id,
        name: target.name
      }
    }
    target_hash[:target] = target_hash[:target].merge({dead: true}) if target.dead?
    unit = unit.merge(damage) if damage
    unit = unit.merge(heal) if heal
    unit = unit.merge(target_hash) if target_hash
  end

  protected

    def receive_damage(amount)
      update_attribute(:current_health, current_health - amount)
    end

    def earn_experience(amount)
      update_attribute(:experience, [experience + amount, 10].max)
    end

    def is_physical?(dmg_type)
      (dmg_type % 10) == DMG_TYPE_PHYSICAL
    end

    def is_healing?(dmg_type)
      (dmg_type % 10) == DMG_TYPE_HEALING
    end

    def is_magical?(dmg_type)
      (dmg_type % 10) == DMG_TYPE_MAGICAL
    end

end
