class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  before_save { self.email = email.downcase }
end
