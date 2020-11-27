class User < ApplicationRecord
    belongs_to :level

    has_many :user_questions
    has_many :questions, through: :user_questions

    has_secure_password

    
    validates :username, uniqueness: true, presence: true
    validates :username, uniqueness: { case_sensitive: false }

    def weaknesses 
        weakHash = {}
        weakness_tag_arr = []
        self.questions.each do |q|
            q.tags.each do |t|
                if (weakHash[t.name])
                    weakHash[t.name] += 1
                else
                    weakHash[t.name] = 1
                end
            end
        end
        weakHash = weakHash.sort_by{|key, value| -value}
        weakHash = weakHash.first(8).to_h
        weakHash.each{|key, value| weakness_tag_arr.push(Tag.find_by(name: key))}
        return weakness_tag_arr
    end
end
