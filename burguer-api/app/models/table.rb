# == Schema Information
#
# Table name: tables
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Table < ActiveRecord::Base

  validates :number,
            presence: true

  has_many :orders, as: :orderable
end
