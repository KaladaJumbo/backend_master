class Level < ApplicationRecord
    has_many :questions
    has_many :users
end
