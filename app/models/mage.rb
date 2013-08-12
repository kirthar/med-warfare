class Mage < Unit
  attr_accessible :description, :image, :name

  BASE_DMG = 5
  MAGIC_DMG = 30

  def default_dmg_type
    DMG_TYPE_CRUSHING
  end
end
