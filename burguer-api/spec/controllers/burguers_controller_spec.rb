require 'spec_helper'

describe BurguersController do

  let!(:burguer) { create(:burguer, price: 10.99) }

  let(:valid_attributes) { { name: "BigOne", price: '10.10' } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all burguers as @burguers" do
      get :index, {}, valid_session
      expect(assigns(:burguers)).to eq([burguer])
    end
  end

  describe "GET show" do
    it "assigns the requested burguer as @burguer" do
      get :show, {:id => burguer.id}, valid_session
      expect(assigns(:burguer)).to eq(burguer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Burguer" do
        expect {
          post :create, {:burguer => valid_attributes}, valid_session
        }.to change(Burguer, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved burguer as @burguer" do
        post :create, {:burguer => { name: "" }}, valid_session
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested burguer" do
        put :update, {:id => burguer.id, :burguer => { name: "NewName" }}, valid_session
        expect(response.body).to include('NewName')
      end
    end

    describe "with invalid params" do
      it "updates the requested burguer" do
        put :update, {:id => burguer.id, :burguer => { price: '' }}, valid_session
        expect(response.body).to include('be blank')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested burguer" do
      expect {
        delete :destroy, { :id => burguer.id }, valid_session
      }.to change(Burguer, :count).by(-1)
    end
  end

end
