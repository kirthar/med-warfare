class Rogue < Unit
  attr_accessible :description, :image, :name

  def magic_attack(target)
    2.times.basic_attack(target)
  end

end
