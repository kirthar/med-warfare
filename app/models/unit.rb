class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :type, :unit_images_attributes

  CLASSES = %w{Archer Mage Rogue Knight Priest}

  BASE_DMG = 10
  MAGIC_DMG = 20

  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  def default_image
    unit_images.first.image if unit_images.any?
  end


  def basic_attack(target)
    do_damage(target, BASE_DMG)
    Action.create(unit: self, target: target, action: Action::BASIC_ATT)
  end

  def magic_attack(target)
    do_damage(target, MAGIC_DMG)
  end

  def defense
    defending = true
  end

  def do_damage_to(target, amount)

  end

end
