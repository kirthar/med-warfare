class UsersController < ApplicationController
  load_resource


  def send_challange
    combat = Combat.find(params[:combat_id])
    if combat.users.include?(@user)
      flash[:alert] = 'This user is already in the combat.'
    else
      UserCombat.create(combat: combat, user: @user, challange_state: :pending)
    end

    redirect_to :back
  end

  def join_to_combat
    combat = Combat.find(params[:combat_id])
    challange = @user.challange(combat)
    if challange.present? and challange.accepted?
      flash[:alert] = 'You are already in the combat.'
    else
      challange.accept!
      combat.start! unless combat.user_combats.pending.any?
    end

    redirect_to :back
  end

  def reject_challange
    challange = UserCombat.find_by_combat_id_and_user_id(params[:combat_id], current_user.id)
    if challange.empty?
      flash[:error] = 'You were not challanged for this combat'
    else
      challange.reject!
    end

    redirect_to :back
  end

  def leave_combat
    if challange = UserCombat.find_by_combat_id_and_user_id(params[:combat_id], @user.id)
      challange.combat.in_course? ? challange.surrender! : challange.reject!

      combat = Combat.find(params[:combat_id])
      unless combat.user_combats.accepted.any?
        if combat.in_course?
          combat.finish!
        else
          combat.destroy
        end
      end

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