class Notifcation < ApplicationRecord
    validates :title, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :text, :presence => true
    belongs_to :request, :class_name => "Model"
    def self.savenotify(id,text,link,title,color="blue",icon="mdi mdi-bell")
        notifcation=Notifcation.new
        notifcation.owner_id = id
        notifcation.text = text
        notifcation.title = title
        notifcation.link = link 
        notifcation.color = color
        notifcation.icon= icon
        end
end
