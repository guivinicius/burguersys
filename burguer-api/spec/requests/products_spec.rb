require 'spec_helper'

describe 'Products API' do

  let(:product) { create(:product) }

  describe 'GET /products' do

    it 'return status 200' do
      get '/products'
      expect(json['status']).to eq(200)
    end

    it 'returns all products' do
      create(:product, name: 'TheOther', price: BigDecimal(12.20))

      get '/products'
      expect(json.length).to eq(2)
    end

  end

  describe 'GET /products/:id' do

    it 'return status 200' do
      get "/products/#{product.id}"
      expect(json['status']).to eq(200)
    end

    it 'returns a product' do
      get "/products/#{product.id}"
      expect(json.length).to eq(1)
    end

  end

  describe 'POST /products' do

    it 'return status 200' do
      post "/products", name: 'BigBig', price: BigDecimal(20)
      expect(json['status']).to eq(200)
    end

  end

  describe 'PUT /products/:id' do

    it 'return status 200' do
      post "/products/#{product.id}", name: 'BigBig'
      expect(json['status']).to eq(200)
    end

    it 'return the updated record' do
      post "/products/#{product.id}", name: 'BigBig'
      expect(json).to include('BigBig')
    end

  end
end
