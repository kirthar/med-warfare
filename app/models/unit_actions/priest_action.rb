module UnitActions
  class PriestAction < UnitAction
    class << self
      def heal(unit, target)
        unit.do_damage_to(target, Unit::BASE_DMG, Unit::DMG_TYPE_HEAL)
      end
    end
  end
end