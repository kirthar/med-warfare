class UnitsController < ApplicationController
  load_resource

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
      redirect_to unit_path(@unit)
    else
      redirect_to edit_unit_path(@unit)
    end
  end
end
