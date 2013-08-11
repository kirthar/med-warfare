class Unit < ActiveRecord::Base
  attr_accessible :description, :name, :unit_images_attributes

  has_many :unit_images, :dependent => :destroy
  accepts_nested_attributes_for :unit_images

  def default_image
    unit_images.first.image
  end

end
