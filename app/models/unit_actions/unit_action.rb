module UnitActions
  class UnitAction
    class << self
      def basic_attack(unit, target)
        unit.do_damage_to(target, Unit::BASE_DMG, unit.default_dmg_type)
        CombatAction.create(unit: unit, target: target, action: CombatAction::BASIC_ATT)
      end

      def magic_attack(unit, target)
        unit.do_damage_to(target, Unit::MAGIC_DMG)
        CombatAction.create(unit: unit, target: target, action: CombatAction::MAGIC_ATT)
      end

      def defend(unit, target)

      end
    end
  end
end