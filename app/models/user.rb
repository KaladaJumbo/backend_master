class User < ApplicationRecord
    belongs_to :level
    has_secure_password

    
    validates :username, uniqueness: true, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end