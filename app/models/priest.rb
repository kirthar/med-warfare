class Priest < Unit
  attr_accessible :description, :image, :name

  def skills
    super + ['heal', 'resurrect']
  end

end
