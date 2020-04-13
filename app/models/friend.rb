class Friend < ApplicationRecord
    belongs_to :request, :class_name => "Model"
    belongs_to :reciver, :class_name => "Model"
end
