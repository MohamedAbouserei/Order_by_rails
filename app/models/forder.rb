class Forder < ApplicationRecord
    validates :meal, :presence => true,:length => { :maximum => 50 }
    validates :meal, :resturant => true,:length => { :maximum => 50 }
    validates :meal, :image => true,:length => { :maximum => 50 }
    belongs_to :model
end
