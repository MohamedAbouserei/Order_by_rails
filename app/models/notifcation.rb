class Notifcations < ApplicationRecord
    validates :title, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :text, :presence => true
end
