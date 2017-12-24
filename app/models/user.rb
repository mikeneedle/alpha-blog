class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { minimum: 10, maximum: 200 }
  
end
