class User < ActiveRecord::Base
    #username must be present and unique
    validates :username, 
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 25 }
    
    # email must be present and unique
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,
        presence: true,
        length: { maximum: 105 },
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }
    # validate email format using regex
end
