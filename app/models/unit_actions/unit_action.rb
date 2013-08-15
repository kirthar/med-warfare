module UnitActions
  class UnitAction
    class << self
      def basic_attack(unit, target)
        unit.do_damage_to(target, Unit::BASE_DMG, unit.default_dmg_type)
      end

      def magic_attack(unit, target)
        unit.do_damage_to(target, Unit::MAGIC_DMG)
      end

      def defend(unit, target)

      end
    end
  end
end