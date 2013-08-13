class CombatsController < ApplicationController
  load_resource

  def index
    render layout: 'sidebar'
  end

  def show
    @combat_actions = @combat.combat_actions
  end


  def create

    respond_to do |format|
      if @combat.save
        format.html { redirect_to @combat, notice: 'Combat was successfully created.' }
        format.json { render json: @combat, status: :created, location: @combat }
      else
        format.html { render action: "new" }
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
        format.html { render action: "edit" }
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

end
