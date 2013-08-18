module Skills
  class BasicAttack < BaseSkill
    class << self
      def skill(unit, target)
        attack_roll = rand(100)
        defense_roll = rand(100)
        damage = Unit::BASE_DMG
        if attack_roll <= unit.hit_chance and defense_roll > target.evade_chance
          damage *= critical_damage if attack_roll <= unit.critical_chance
          unit.do_damage_to(target, damage, unit.default_dmg_type)
        else
          miss(unit, target)
        end
      end
    end
  end
end