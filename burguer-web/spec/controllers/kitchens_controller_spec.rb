require 'spec_helper'

describe KitchensController do

  describe "GET 'index'" do
    it "returns http success" do
      VCR.use_cassette('orders') do
        get 'show'
        expect(response).to be_success
      end
    end
  end

end
