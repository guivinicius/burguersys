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
      render json: @order, status: :created, location: @order
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
    params.require(:order).permit(:status, :address_id, :orderable_id, :orderable_type, order_items_attributes: [:product_id, :quantity])
  end
end
