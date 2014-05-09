# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  status         :integer          not null
#  orderable_id   :integer
#  orderable_type :string(255)
#  address_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Order do

  let(:order) { create(:order) }

  it 'is valid' do
    expect(order).to be_valid
  end

end
