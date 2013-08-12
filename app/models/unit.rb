class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :type, :unit_images_attributes

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
  DMG_TYPE_HEAL  = 10
  DMG_TYPE_FIRE  = 20
  DMG_TYPE_ICE   = 30
  DMG_TYPE_EARTH = 40
  DMG_TYPE_WIND  = 50

  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  scope :by_type, lambda {|name| where(type: name) }

  def default_image
    unit_images.first.image if unit_images.any?
  end

  def default_dmg_type
    DMG_TYPE_SLASHING
  end

  def basic_attack(target)
    do_damage_to(target, BASE_DMG, default_dmg_type)
    CombatAction.create(unit: self, target: target, action: CombatAction::BASIC_ATT)
  end

  def magic_attack(target)
    do_damage(target, MAGIC_DMG)
  end

  def defense
    defending = true
  end

  def dead?
    current_health <= 0
  end

  protected
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

    def receive_damage(amount)
      update_attribute(:current_health, current_healt - amount)
    end

    def earn_experience(amount)
      update_attribute(:experience, experience + amount)
    end

    def is_physical?(dmg_type)
      (dmg_type / 10) == DMG_TYPE_PHYSICAL
    end

end
