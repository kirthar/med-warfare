class Archer < Unit
  attr_accessible :description, :image, :name

  def default_dmg_type
    DMG_TYPE_PIERCING
  end

end
