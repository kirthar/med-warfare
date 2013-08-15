class Archer < Unit
  attr_accessible :description, :image, :name

  ACTIONS_CLASS = 'archer'

  def default_dmg_type
    DMG_TYPE_PIERCING
  end

end
