class UserCombat < ActiveRecord::Base
  include AASM

  attr_accessible :user, :combat, :challange_state
  belongs_to :combat
  belongs_to :user

  aasm :column => 'challange_state' do # default column: aasm_state
    state :pending, :initial => true
    state :accepted
    state :rejected
    state :surrendered

    event :accept do
      transitions :from => :pending, :to => :accepted
    end

    event :reject do
      transitions :from => [:pending, :accepted], :to => :rejected
    end

    event :surrender do
      transitions :from => :accepted, :to => :surrendered
    end
  end

end
