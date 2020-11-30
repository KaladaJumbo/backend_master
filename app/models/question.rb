class Question < ApplicationRecord
    belongs_to :level
    has_many :question_tags
    has_many :tags, through: :question_tags

    has_many :user_questions
    has_many :users, through: :user_questions



    def self.random10
        arr = []
        10.times do 
            arr.push(Question.all.sample)
        end
        return arr
    end

    def self.random_chords
        arr = []
        10.times do 
            arr.push(Tag.find_by(name: "chords").questions.all.sample)
        end
        return arr
    end

    def self.random_notes
        arr = []
        10.times do 
            arr.push(Tag.find_by(name: "notes").questions.all.sample)
        end
        return arr
    end

    def self.random_major
        arr = []
        10.times do 
            arr.push(Tag.find_by(name: "major").questions.all.sample)
        end
        return arr
    end

    def self.random_minor
        arr = []
        10.times do 
            arr.push(Tag.find_by(name: "minor").questions.all.sample)
        end
        return arr
    end

    def self.random_custom(tag)
        arr = []
        if tag == "random10"
            return random10
        else
            10.times do 
                arr.push(Tag.find_by(name: tag).questions.all.sample)
            end
            return arr
        end
    end

    def self.random_with_tags(tags)
        arr = []
        # byebug
        tags.each do |tag|
            tag = Tag.find(tag["id"])
            question = tag.questions.all.sample
            arr.push(question)
        end
        while (arr.length < 10)
            arr.push(Question.all.sample)
        end
        arr = arr.shuffle
        return arr
    end

end
