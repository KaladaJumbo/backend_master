class Question < ApplicationRecord
    belongs_to :level
    has_many :question_tags
    has_many :tags, through: :question_tags


    def self.random10
        arr = []
        10.times do 
            arr.push(Question.all.sample)
        end
        return arr
    end
end
