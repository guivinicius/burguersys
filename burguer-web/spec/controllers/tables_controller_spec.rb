require 'spec_helper'

describe TablesController do

  describe "GET 'index'" do
    it "returns http success" do
      VCR.use_cassette('tables') do
        get 'index'
        expect(response).to be_success
      end
    end
  end

end
