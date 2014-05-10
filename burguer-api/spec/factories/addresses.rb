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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "alameda V"
    number "111"
    postalcode "18086789"
    neighborhood "Bairro do Barro"
    city "Votorantim"
    state "SP"
  end
end
