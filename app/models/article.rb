class Article < ActiveRecord::Base
    validates :tltle, presence: true, length: { minimum: 3, maximum: 50}
    validates :description, presence: true
end 
