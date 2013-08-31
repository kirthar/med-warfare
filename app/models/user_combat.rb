class UserCombat < ActiveRecord::Base
  include AASM

  attr_accessible :user, :combat, :challange_state, :pending_since
  belongs_to :combat
  belongs_to :user

  aasm :column => 'challange_state' do # default column: aasm_state
    state :pending, :initial => true
    state :accepted
    state :rejected
    state :surrendered
    state :dead
    state :won

    event :accept do
      transitions :from => :pending, :to => :accepted
    end

    event :reject do
      transitions :from => [:pending, :accepted], :to => :rejected
    end

    event :surrender do
      transitions :from => :accepted, :to => :surrendered
    end

    event :die do
      transitions :from => :accepted, :to => :dead
    end

    event :win do
      transitions :from => :accepted, :to => :won
    end
  end

end
