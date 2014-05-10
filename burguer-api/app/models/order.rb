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

class Order < ActiveRecord::Base
  enum status: [:waiting, :doing, :done, :delivered, :canceled]

  validates :orderable_id, :orderable_type,
            presence: true

  belongs_to :orderable,
             polymorphic: true

  belongs_to :address

  has_many :order_items,
           dependent: :destroy

  validates_associated :order_items, :orderable

  accepts_nested_attributes_for :order_items, :address

  def as_json(options)
    super(include: [:order_items, :address])
  end
end
