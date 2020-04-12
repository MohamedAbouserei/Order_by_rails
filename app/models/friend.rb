class Friend < ApplicationRecord
    belongs_to :model, class_name: "Model"
    belongs_to :friend, class_name: "Model" 
    enum status: { accept: 0, deny: 1, no_reply: 2 }
    has_many :fgroups
    belongs_to :request, :class_name => "Model"
    belongs_to :reciver, :class_name => "Model"
end
