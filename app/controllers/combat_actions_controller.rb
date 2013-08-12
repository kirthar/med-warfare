class CombatActionsController < ApplicationController
  load_resource

  def create
    if @combat_action.save
      redirect_to @combat_action
    else
      redirect_to new_combat_action_path
    end
  end

  def update
    if @combat_action.update_attributes(params[:combat_action])
      redirect_to @combat_action
    else
      redirect_to edit_combat_action_path(@combat_action)
    end
  end

  def destroy
    @combat_action.destroy
    redirect_to combat_actions_path
  end

end
