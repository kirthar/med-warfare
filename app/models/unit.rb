class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :type, :unit_images_attributes, :user

  CLASSES = %w{Archer Mage Rogue Knight Priest}

  EXP_PER_KILL = 0.1

  BASE_DMG = 10
  MAGIC_DMG = 20

  # Damage Types
  # Physical
  DMG_TYPE_PHYSICAL = 0
  DMG_TYPE_SLASHING = 1
  DMG_TYPE_PIERCING = 2
  DMG_TYPE_CRUSHING = 3

  # Magic
  DMG_TYPE_MAGIC = 10
  DMG_TYPE_FIRE  = 20
  DMG_TYPE_ICE   = 30
  DMG_TYPE_EARTH = 40
  DMG_TYPE_WIND  = 50

  DMG_TYPE_HEAL  = 100

  belongs_to :user
  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  scope :by_type, lambda {|name| where(type: name) }

  def default_image
    unit_images.first.image if unit_images.any?
  end

  def default_dmg_type
    DMG_TYPE_SLASHING
  end

  def use_skill(skill, target)
    skill.classify.constantize.skill(self, target)
  end

  def can_target_skill?(skill_name, target)
    skill = skill_name.classify.constantize

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
    case dmg_type
      when DMG_TYPE_HEAL
        amount = -1 * amount
    end

    target.receive_damage(amount)

    if target.dead?
      earn_experience(target.experience * EXP_PER_KILL)
    end
  end

  protected

    def receive_damage(amount)
      update_attribute(:current_health, current_health - amount)
    end

    def earn_experience(amount)
      update_attribute(:experience, max(experience + amount, 10))
    end

    def is_physical?(dmg_type)
      (dmg_type / 10) == DMG_TYPE_PHYSICAL
    end

end
