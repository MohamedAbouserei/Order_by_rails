class Forder < ApplicationRecord
    validates :meal, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :resturant, :presence => true, :length => { :maximum => 50 , :minimum => 3}
    validates :image, :presence => true, :length => { :maximum => 50 }
    belongs_to :model, class_name: "Model", foreign_key: "model_id"
    has_many :orderusers, class_name: "OrderUser"
end
