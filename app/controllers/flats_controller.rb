class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show create edit update destroy]
  def index
    @flats = Flat.all
  end

  def show

  end

  def new
    @flat = Flat.new
  end

  def create
    if @flat.create(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # sef_flat
  end

  def update
    if @flat.update!(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
