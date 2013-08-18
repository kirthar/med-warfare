module Skills
  class Defend < BaseSkill
    class << self
      def skill(unit, target)
        {unit: {id: unit.id, name: unit.name}, target: { id: target.id, name: target.name, dead: target.dead? }}
      end
    end
  end
end