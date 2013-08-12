class Knight < Unit
  attr_accessible :description, :image, :name

  def default_dmg_type
    DMG_TYPE_CRUSHING
  end
end
