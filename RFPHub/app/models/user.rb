class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presense: true

  has_secure_password

end
