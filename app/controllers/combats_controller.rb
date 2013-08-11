class CombatsController < ApplicationController
  # GET /combats
  # GET /combats.json
  def index
    @combats = Combat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @combats }
    end
  end

  # GET /combats/1
  # GET /combats/1.json
  def show
    @combat = Combat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @combat }
    end
  end

  # GET /combats/new
  # GET /combats/new.json
  def new
    @combat = Combat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @combat }
    end
  end

  # GET /combats/1/edit
  def edit
    @combat = Combat.find(params[:id])
  end

  # POST /combats
  # POST /combats.json
  def create
    @combat = Combat.new(params[:combat])

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

  # PUT /combats/1
  # PUT /combats/1.json
  def update
    @combat = Combat.find(params[:id])

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

  # DELETE /combats/1
  # DELETE /combats/1.json
  def destroy
    @combat = Combat.find(params[:id])
    @combat.destroy

    respond_to do |format|
      format.html { redirect_to combats_url }
      format.json { head :no_content }
    end
  end
end
