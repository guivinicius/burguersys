# == Schema Information
#
# Table name: burguers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  price      :decimal(10, 2)   default(0.0), not null
#  created_at :datetime
#  updated_at :datetime
#

class Burguer < ActiveRecord::Base

  validates :name, :price,
            presence: true

  validates :price,
            numericality: { greater_than_or_equal_to: 0 }
end
