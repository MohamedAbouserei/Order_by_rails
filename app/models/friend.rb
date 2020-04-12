class Friend < ApplicationRecord
    belongs_to :model, class_name: "Model"
    belongs_to :friend, class_name: "Model" 
    enum status: { accept: 0, deny: 1, no_reply: 2 }
    has_many :fgroups
end
