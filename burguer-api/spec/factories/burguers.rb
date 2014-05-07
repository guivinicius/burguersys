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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :burguer do
    name "TheOne"
    price 9
  end
end
