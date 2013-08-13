class UnitImagesController < ApplicationController
  load_and_authorize_resource

  def destroy
    @unit_image.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
