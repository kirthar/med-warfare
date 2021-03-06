class CombatsController < ApplicationController
  load_and_authorize_resource

  def show
    return redirect_to victory_combat_path(@combat) if @combat.winner
    @unit = @combat.current_unit || @combat.units.ordered.first
    @combat_actions = @combat.combat_actions.newest_first
    @users_not_in_combat = User.excluding_ids(@combat.users.pluck(:id))
    @targets = @combat.units
  end

  def edit
    @users_not_in_combat = User.excluding_ids(@combat.users.pluck(:id))
  end

  def new
    @users_excluding_me = User.excluding_ids([current_user.id]).map{|user| [user.username, user.id]}
  end

  def create

    respond_to do |format|
      if @combat.save
        UserCombat.create(user: current_user, combat: @combat, challange_state: :accepted)
        UserCombat.create(user: User.find(params[:user_combats][:user_id]), combat: @combat)
        format.html { redirect_to @combat, notice: 'Combat was successfully created.' }
        format.json { render json: @combat, status: :created, location: @combat }
      else
        format.html { render action: 'new' }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @combat.update_attributes(params[:combat])
        format.html { redirect_to @combat, notice: 'Combat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @combat.destroy

    respond_to do |format|
      format.html { redirect_to combats_url }
      format.json { head :no_content }
    end
  end


  def victory
    unless @winner = @combat.winner
      flash[:error] = 'This combat does not have a winner yet.'
      return redirect_to @combat
    end

    @money_per_win = 100
    @exp_per_win = 100
  end

end
