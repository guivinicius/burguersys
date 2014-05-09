# == Schema Information
#
# Table name: partners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Partner do
  let(:partner) { create(:partner) }

  it 'is valid' do
    expect(partner).to be_valid
  end
end
