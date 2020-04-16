class Notifcation < ApplicationRecord
    validates :title, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :text, :presence => true
    belongs_to :model, :class_name => "Model" 
    def self.savenotify(id,text,link,title,color="blue",icon="mdi mdi-bell")
        @notifcation=self.new
        @notifcation.model_id = id
        @notifcation.text = text
        @notifcation.title = title
        @notifcation.link = link 
        @notifcation.color = color
        @notifcation.icon= icon
        @notifcation.save
        end
end
