# == Schema Information
#
# Table name: partners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Partner < ActiveRecord::Base

  validates :name, :token,
            presence: true

  before_validation :generate_token

  has_many :orders, as: :orderable

  private

  def generate_token
    token = SecureRandom.urlsafe_base64
  end
end
