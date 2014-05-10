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

class Address < ActiveRecord::Base
  validates :street, :number, :postalcode, :neighborhood, :city, :state,
            presence: true

  has_one :order
end
