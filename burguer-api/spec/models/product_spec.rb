# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  price      :decimal(10, 2)   default(0.0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Product do

  let(:product) { create(:product) }

  it 'is valid' do
    expect(product).to be_valid
  end

end
