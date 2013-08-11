class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :unit_images_attributes

  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  def default_image
    unit_images.first.image
  end


  def basic_attack(target)
    do_damage(target, 10)
  end

  def magic_attack(target)
    do_damage(target, 20)
  end

  def defense
    defending = true
  end

  def do_damage_to(target, amount)

  end

end
