class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE '%#{@query}%'")
    else  
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    if @flat.save
      redirect_to flats_path, notice: 'flat was successfully craeted.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    if @flat.save
      redirect_to flat_path(@flat), notice:  'flat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end
  
  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end



end
