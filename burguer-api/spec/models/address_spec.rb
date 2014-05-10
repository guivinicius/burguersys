# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  street       :string(255)
#  number       :string(255)
#  postalcode   :string(255)
#  neighborhood :string(255)
#  city         :string(255)
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Address do

  let(:address) { create(:address) }

  it 'is valid' do
    expect(address).to be_valid
  end
end
