class Combat < ActiveRecord::Base
  include AASM

  has_many :combat_actions
  has_many :user_combats
  has_many :users, :through => :user_combats
  has_many :units, :through => :users

  aasm :column => 'status' do
    state :pending, :initial => true
    state :in_course
    state :finished

    event :start do
      after do
        set_current_unit
      end
      transitions :from => :pending, :to => :in_course
    end

    event :finish do
      transitions :from => :in_course, :to => :finished
    end

  end

  def all_dead?(units)
    not units.any? { |unit| unit.alive? }
  end

  def next_turn!
    return units.first unless units.alive.any? and current_unit_id.present?

    # Set Next Unit
    next_units = units.alive.after(current_unit)
    next_unit = next_units.any? ? next_units.first : units.alive.ordered.first
    update_attribute(:current_unit_id, next_unit.id)

    # Set User as pending
    user_combats.update_all(pending_since: nil)
    next_user = user_combats.find_by_user_id(next_unit.user.id)
    next_user.update_attribute(:pending_since, DateTime.current)

  end

  def is_team_dead?(unit)
    all_dead?(unit.user.units)
  end

  def current_unit
    return nil unless current_unit_id.present? and current_unit = Unit.find(current_unit_id)
    current_unit
  end

  def set_current_unit
    initial_unit = units.alive.ordered.first
    update_attribute(:current_unit_id, initial_unit.id)
  end

  def victory?
    return false unless user_combats.accepted.count == 1
    winner = user_combats.accepted.first
    winner.win!
    finish!
    winner.user
  end

  def winner
    user_combats.won.first.user if user_combats.won.any?
  end
end
