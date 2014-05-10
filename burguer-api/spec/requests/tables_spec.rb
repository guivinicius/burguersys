require 'spec_helper'

describe 'Products API' do
  let!(:table1) { create(:table, number: 1) }
  let!(:table2) { create(:table, number: 2) }

  describe 'GET /api/tables' do
    before do
      get '/api/tables'
    end

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns all tables' do
      expect(json.length).to eq(2)
    end
  end
end
