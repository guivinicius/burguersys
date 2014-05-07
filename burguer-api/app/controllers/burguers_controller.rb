class BurguersController < ApplicationController

  def index
    @burguers = Burguer.all

    render json: @burguers
  end

  def show
    @burguer = Burguer.find(params[:id])

    render json: @burguer
  end

  def create
    @burguer = Burguer.new(burguer_params)

    if @burguer.save
      render json: @burguer, status: :created, location: @burguer
    else
      render json: @burguer.errors, status: :unprocessable_entity
    end
  end

  def update
    @burguer = Burguer.find(params[:id])

    if @burguer.update(burguer_params)
      render json: @burguer
    else
      render json: @burguer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @burguer = Burguer.find(params[:id])
    @burguer.destroy

    render json: @burguer
  end

  private

  def burguer_params
    params.require(:burguer).permit(:name, :price)
  end
end
