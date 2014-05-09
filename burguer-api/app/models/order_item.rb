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

class OrderItem < ActiveRecord::Base

  validates :price, :quantity, :product_id,
            presence: true

  belongs_to :order
  belongs_to :product

  def total
    quantity * price
  end
end
