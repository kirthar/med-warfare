module Units
  class Archer < Unit
    attr_accessible :description, :image, :name

    MAGIC_DMG = 7

    def default_dmg_type
      DMG_TYPE_PIERCING
    end

    def skills
      super + ['true_shoot']
    end

  end
end