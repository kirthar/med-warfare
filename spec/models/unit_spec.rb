require 'spec_helper'

describe Unit do

  its "is priest" do
    unit = create(:priest)

    expect(unit.class.name).to eq('Units::Priest')
  end

  its "is archer" do
    unit = create(:archer)

    expect(unit.class.name).to eq('Units::Archer')
  end

  its "use true shoot" do
    unit = create(:archer)
    target = create(:dummie)
    skill = 'true_shoot'
    expect(unit.use_skill(skill, target)).to eq( {
                                                     :unit=>{:id=>unit.id, :name=>unit.name},
                                                     :damage=>{:type=>20, :amount=>22},
                                                     :target=>{:id=>target.id, :name=>target.name, :dead=>target.dead?},
                                                     :action=>skill
                                                 }
                                               )
  end
end
