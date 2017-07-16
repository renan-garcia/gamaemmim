class Lead < ApplicationRecord
  validates_presence_of :name, :ip
  validates :email, presence: true, email: true
  validate :ip_check

  def ip_check
    errors.add(:ip, 'Ip address is not valid.') unless IPAddress.valid? ip
  end
end
