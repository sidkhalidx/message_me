class User < ApplicationRecord
    validates :username, presence: true, uniqueness: { case_sensitivity: false }
    has_secure_password
    has_many :messages
end
