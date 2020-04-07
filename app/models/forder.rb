class Forder < ApplicationRecord
    validates :meal, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :resturant, :presence => true, :length => { :maximum => 50 , :minimum => 3}
    validates :image, :presence => true, :length => { :maximum => 50 }
    belongs_to :model, class_name: "model", foreign_key: "model_id"
end
