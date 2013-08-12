class UnitImage < ActiveRecord::Base

  attr_accessible :image, :unit

  mount_uploader :image, ImageUploader

  belongs_to :unit

end
