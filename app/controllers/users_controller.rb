class UsersController < ApplicationController
  load_resource

  def join_to_combat
    combat = Combat.find(params[:combat_id])
    if combat.users.include?(@user)
      flash[:alert] = 'This user is already in the combat.'
    else
      UserCombat.create(combat: combat, user: @user)
    end

    redirect_to :back
  end

  def leave_combat
    if user_combat = UserCombat.find_by_combat_id_and_user_id(params[:combat_id], @user.id)
      user_combat.delete

      combat = Combat.find(params[:combat_id])
      combat.destroy unless combat.users.any?

      flash[:success] = 'The user left the combat.'
    else
      flash[:alert] = 'This user is not in the combat.'
    end

    if @user == current_user
      redirect_to combats_path
    else
      redirect_to :back
    end
  end

end