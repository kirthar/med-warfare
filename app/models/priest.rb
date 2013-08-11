class Priest < Unit
  attr_accessible :description, :image, :name

  def basic_attack(target)
    heal(target)
  end

  def heal(target)
    do_damage(target, -1 * BASIC_DMG)
  end
end
