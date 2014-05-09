require 'spec_helper'

describe ProductsController do

  let!(:product) { create(:product, price: 10.99) }

  let(:valid_attributes) { { name: "BigOne", price: '10.10' } }

  describe "GET index" do
    it "assigns all Products as @Products" do
      get :index, {}
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET show" do
    it "assigns the requested Product as @Product" do
      get :show, { id: product.id }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved Product as @Product" do
        expect {
          post :create, { product: { name: '' } }
        }.not_to change(Product, :count).by(1)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested Product" do
        expect_any_instance_of(Product).to receive(:update).with('name' => 'NewName').and_return(true)
        put :update, id: product.id, product: { name: "NewName" }
      end
    end
  end

end
