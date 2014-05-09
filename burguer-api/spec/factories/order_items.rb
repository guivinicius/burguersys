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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    price 9
    product_id 1
    quantity 1
    order_id 1
  end
end
