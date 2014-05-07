require 'spec_helper'

describe ProductsController do

  let!(:product) { create(:product, price: 10.99) }

  let(:valid_attributes) { { name: "BigOne", price: '10.10' } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all Products as @Products" do
      get :index, {}, valid_session
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET show" do
    it "assigns the requested Product as @Product" do
      get :show, {:id => product.id}, valid_session
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, {:product => valid_attributes}, valid_session
        }.to change(Product, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved Product as @Product" do
        post :create, {:product => { name: "" }}, valid_session
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested Product" do
        put :update, {:id => product.id, :product => { name: "NewName" }}, valid_session
        expect(response.body).to include('NewName')
      end
    end

    describe "with invalid params" do
      it "updates the requested Product" do
        put :update, {:id => product.id, :product => { price: '' }}, valid_session
        expect(response.body).to include('be blank')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested Product" do
      expect {
        delete :destroy, { :id => product.id }, valid_session
      }.to change(Product, :count).by(-1)
    end
  end

end
