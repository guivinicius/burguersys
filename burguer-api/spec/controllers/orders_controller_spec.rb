require 'spec_helper'

describe OrdersController do

  let(:product) { create(:product) }
  let(:table)   { create(:table)   }
  let!(:order)   {
    create(:order, orderable_id: table.id, orderable_type: 'Table')
  }

  let(:valid_attributes) {
    { orderable_id: table.id,
      orderable_type: 'Table',
      order_items_attributes:
        [
          { product_id: product.id, quantity: 2 }
        ]
    }
  }

  let(:invalid_attributes) {
    { orderable_id: '',
      orderable_type: 'Table',
      order_items_attributes:
        [
          { product_id: product.id, quantity: '' }
        ]
    }
  }


  describe "GET index" do
    it "assigns all Orders as @Orders" do
      get :index, {}
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET show" do
    it "assigns the requested Order as @Order" do
      get :show, { id: order.id }
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, order: valid_attributes
        }.to change(Order, :count).by(1)
      end

      it "creates a new OrderItem" do
        expect {
          post :create, order: valid_attributes
        }.to change(OrderItem, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "does not create a new Order" do
        expect {
          post :create, order: invalid_attributes
        }.not_to change(Order, :count).by(1)
      end

      it "does not create a new OrderItem" do
        expect {
          post :create, order: invalid_attributes
        }.not_to change(OrderItem, :count).by(1)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested Order" do
        expect_any_instance_of(Order).to receive(:update).and_return(true)
        put :update, id: order.id, order: { order_items_attributes: [{product_id: product.id, quantity: 1}] }
      end
    end
  end

end
