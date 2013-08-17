module Units
  class Rogue < Unit
    attr_accessible :description, :image, :name

    def skills
      super + ['sneak_attack']
    end
  end
end
