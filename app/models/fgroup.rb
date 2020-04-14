class Fgroup < ApplicationRecord
    has_many :groupUsers, class_name: "Groupuser"
    validates :name , :presence => true , length: {maximum:50,minimum:3} , :uniqueness =>  true 
    validates :model_id , :presence => true , :uniqueness =>  true
    belongs_to :model
end
