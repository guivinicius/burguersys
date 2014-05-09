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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    status 1
    orderable_id 1
    orderable_type "Table"
    address_id 1
  end
end
