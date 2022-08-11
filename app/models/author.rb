class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: {minimum: 2}
    validates :phone_number, presence: true, length: {is: 10}
    
    
    
    
end
