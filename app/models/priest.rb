class Priest < Unit
  attr_accessible :description, :image, :name

  def basic_attack(target)
    heal(target)
  end

  def heal(target)
    do_damage_to(target, BASIC_DMG, DMG_TYPE_HEAL)
  end
end
