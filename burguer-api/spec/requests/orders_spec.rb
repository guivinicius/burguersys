require 'spec_helper'

describe 'Orders API' do

  let(:product) { create(:product) }
  let(:table)   { create(:table)   }
  let!(:order)  {
    create(:order, orderable_id: table.id, orderable_type: 'Table')
  }

  let(:valid_attributes) {
    { orderable_id: table.id,
      orderable_type: 'Table',
      order_items_attributes:
        [
          { product_id: product.id, quantity: 2 }
        ],
      address_attributes: attributes_for(:address)
    }
  }

  describe 'GET /orders' do
    it 'return status 200' do
      get '/orders'
      expect(response.status).to eq(200)
    end

    it 'returns all products' do
      get '/orders'
      expect(json.length).to eq(1)
    end
  end

  describe 'GET /orders/:id' do
    it 'return status 200' do
      get "/orders/#{order.id}"
      expect(response.status).to eq(200)
    end

    it 'returns a order' do
      get "/orders/#{order.id}"
      expect(json['id']).to eq(order.id)
    end
  end

  describe 'POST /orders' do
    before do
      post '/orders', order: valid_attributes
    end

    it 'return status 200' do
      expect(response.status).to eq(200)
    end

    it 'return the new order' do
      expect(json['status']).to eq('waiting')
    end

    it 'return the new orderItems' do
      expect(json['order_items'].length).to eq(1)
    end

    it 'return the new address' do
      expect(json['address']).to include(attributes_for(:address).as_json)
    end

  end

  describe 'PUT /orders/:id' do
    before do
      put "/orders/#{order.id}", order: { status: 'doing' }
    end

    it 'return status 200' do
      expect(response.status).to eq(200)
    end

    it 'return the updated record' do
      expect(json['status']).to eq('doing')
    end
  end
end
