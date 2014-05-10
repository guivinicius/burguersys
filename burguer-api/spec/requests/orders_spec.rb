require 'spec_helper'

describe 'Orders API' do

  let(:product) { create(:product) }
  let(:table)   { create(:table)   }
  let!(:order)   {
    create(:order, orderable_id: table.id, orderable_type: 'Table')
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
      post "/orders", order: { orderable_id: table.id, orderable_type: 'Table' }
    end
    it 'return status 200' do
      expect(response.status).to eq(200)
    end

    it 'return the new order' do
      expect(json['status']).to eq('waiting')
    end

  end

  describe 'PUT /orders/:id' do
    it 'return status 200' do
      put "/orders/#{order.id}", order: { status: 'doing' }
      expect(response.status).to eq(200)
    end

    it 'return the updated record' do
      put "/orders/#{order.id}", order: { status: 'doing' }
      expect(json['status']).to eq('doing')
    end
  end
end
