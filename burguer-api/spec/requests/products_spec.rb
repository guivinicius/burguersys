require 'spec_helper'

describe 'Products API' do

  let(:product) { create(:product) }

  describe 'GET /api/products' do

    it 'return status 200' do
      get '/api/products'
      expect(response.status).to eq(200)
    end

    it 'returns all products' do
      create(:product)
      create(:product, name: 'TheOther', price: 12)

      get '/api/products'
      expect(json.length).to eq(2)
    end

  end

  describe 'GET /api/products/:id' do

    it 'return status 200' do
      get "/api/products/#{product.id}"
      expect(response.status).to eq(200)
    end

    it 'returns a product' do
      get "/api/products/#{product.id}"
      expect(json['name']).to eq(product.name)
    end

  end

  describe 'POST /api/products' do

    it 'return status 200' do
      post "/api/products", product: { name: 'BigBig', price: 20 }
      expect(response.status).to eq(200)
    end

  end

  describe 'PUT /api/products/:id' do

    it 'return status 200' do
      put "/api/products/#{product.id}", product: { name: 'BigBig' }
      expect(response.status).to eq(200)
    end

    it 'return the updated record' do
      put "/api/products/#{product.id}", product: { name: 'BigBig' }
      expect(json['name']).to eq('BigBig')
    end

  end
end
