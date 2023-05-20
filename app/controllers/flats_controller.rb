class FlatsController < ApplicationController
  before_action :set_flat, only: %i[edit update]
  def index
    @flats = Flat.all
  end

  def edit

  end

  def update
    if @flat.update!(flat_params)
      redirect_to flat_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
