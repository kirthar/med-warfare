# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    association :user, factory: :user, strategy: :build

    factory :priest, :class => 'Units::Priest' do
      name 'Jisus Craist'
      description 'The fucking son of God Christian Edition.'
      physical_resist 100
      magical_resist 100
    end

    factory :archer, :class => 'Units::Archer' do
      name 'Legolas'
      description 'Gayer elf'
    end

    factory :dummie, :class => 'Units::Knight' do
      name 'Dummie'
      description 'The test crash dummie for the medieval warfare.'
    end
  end
end
