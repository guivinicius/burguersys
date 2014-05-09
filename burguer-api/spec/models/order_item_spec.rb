# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  price      :decimal(10, 2)   default(0.0), not null
#  product_id :integer
#  quantity   :integer          default(1)
#  order_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe OrderItem do

  let(:product) { create(:product) }

  let(:order) { create(:order) }

  let(:order_item) {
    create(:order_item, order_id: order.id, product_id: product.id)
  }

  it 'is valid' do
    expect(order_item).to be_valid
  end

end
