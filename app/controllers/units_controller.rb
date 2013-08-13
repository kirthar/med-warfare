class UnitsController < ApplicationController
  load_resource

  def index
    if type = params[:by_type] and Unit::CLASSES.include?(type.capitalize)
      @units = Unit.by_type(type.capitalize)
    end
    render layout: 'sidebar'
  end

  def create
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

end
