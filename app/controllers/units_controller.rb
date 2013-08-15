class UnitsController < ApplicationController
  load_and_authorize_resource

  def index
    @units = current_user.units
    if type = params[:by_type] and Unit::CLASSES.include?(type.capitalize)
      @units = @units.by_type(type.capitalize)
    end
    render layout: 'sidebar'
  end

  def new
    @unit = Unit.new(user: current_user)
  end

  def create
    @unit.user = current_user
    if @unit.save
      if params[:unit_images].present?
        UnitImage.create(image: params[:unit_images][:image], unit: @unit)
      end
      redirect_to unit_path(@unit)
    else
      redirect_to new_unit_path
    end
  end

  def update
    if @unit.update_attributes(params[:unit])
      if params[:unit_images].present?
        UnitImage.create(image: params[:unit_images][:image], unit: @unit)
      end
      redirect_to unit_path(@unit)
    else
      redirect_to edit_unit_path(@unit)
    end
  end

  def destroy
    @unit.destroy
    redirect_to combat_actions_path
  end

  def skillset
    render json: @unit.skills
  end

  def use_skill
    target = Unit.find(params[:target])
    combat = Combat.find(params[:combat_id])
    skill = params[:skill]
    @unit.use_skill(skill, target)
    CombatAction.create(unit: @unit, target: target, action: skill, combat: combat)
    redirect_to :back
  end
end
