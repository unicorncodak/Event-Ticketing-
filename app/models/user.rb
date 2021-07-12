class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :password, presence: true
end
