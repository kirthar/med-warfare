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
      transitions :from => :pending, :to => :in_course
    end

    event :finish do
      transitions :from => :in_course, :to => :finished
    end

  end


end
