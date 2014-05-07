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

class Product < ActiveRecord::Base

  validates :name,
            uniqueness: true,
            presence: true

  validates :price,
            numericality: { greater_than_or_equal_to: 0 },
            presence: true
end
