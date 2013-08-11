class UnitsController < ApplicationController
  load_resource

  def create
    if @unit.save and UnitImage.create(image: params[:unit_images][:image], unit: @unit)
      redirect_to @unit
    else
      redirect_to new_unit_path
    end
  end

  def update
    if @unit.update_attributes(params[:unit])
      redirect_to @unit
    else
      redirect_to edit_unit_path(@unit)
    end
  end
end
