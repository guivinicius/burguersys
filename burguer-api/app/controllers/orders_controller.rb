class OrdersController < ApplicationController
  def index
    @orders = Order.all

    render json: @orders
  end

  def show
    @order = Order.find(params[:id])

    render json: @order
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    address_params     = [:street, :number, :postalcode, :neighborhood, :city, :state]
    order_items_params = [:product_id, :quantity]

    params.require(:order).permit(:status, :orderable_id, :orderable_type, order_items_attributes: order_items_params, address_attributes: address_params)
  end
end
