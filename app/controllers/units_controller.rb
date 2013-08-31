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
    @unit.type = 'Units::'+params[:type_name] if params[:type_name]

    respond_to do |format|
      if @unit.save
        if params[:unit_images].present?
          UnitImage.create(image: params[:unit_images][:image], unit: @unit)
        end
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render json: @unit, status: :created, location: @unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
    end
  end

  def update
    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        if params[:unit_images].present?
          UnitImage.create(image: params[:unit_images][:image], unit: @unit)
        end
        format.html { redirect_to @unit.becomes(Unit), notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
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
    result = @unit.use_skill(skill, target)
    CombatAction.create(unit: @unit, target: target, action: skill, combat: combat, result: result)

    if target.dead?
      if combat.is_team_dead?(target)
        combat.user_combats.find_by_user_id(target.user.id).die!
        winner = combat.victory?
        if winner.present?
          flash[:success] = "#{winner.user.username} has won the combat!"
          return redirect_to combats_path
        end
      end
    end

    combat.next_turn!

    redirect_to :back
  end

end
