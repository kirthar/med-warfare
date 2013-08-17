module Skills
  class BaseSkill
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

    end
  end
end