class Article < ActiveRecord::Base
    
    # relatinoship with user
    belongs_to :user
    
    validates :tltle, 
        presence: true, 
        length: { minimum: 3, maximum: 50}
    validates :description, 
        presence: true
    validates :user_id,
        presence: true
end 
