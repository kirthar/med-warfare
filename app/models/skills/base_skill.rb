module Skills
  class BaseSkill
    DOUBLE    = 2
    TRIPLE    = 3
    QUADRUPLE = 4

    class << self
      def skill
        raise 'Skill not implemented'
      end

      def valid_target?(target)
        target.alive?
      end

      def can_target_self?
        true
      end

      def friendly_fire?
        true
      end

      def enemy_fire?
        true
      end

      def miss(unit, target)
        # Damage log
        damage_log = {unit: {id: unit.id, name: unit.name}}
        damage = {damage: {missed: true}}
        target_hash = {target: {id: target.id, name: target.name}}

        damage_log = damage_log.merge(damage) if damage
        damage_log = damage_log.merge(target_hash) if target_hash
      end

      def critical_damage
        DOUBLE
      end
    end
  end
end