# == Schema Information
#
# Table name: tables
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Table do

  let(:table) { create(:table) }

  it 'is valid' do
    expect(table).to be_valid
  end
end
