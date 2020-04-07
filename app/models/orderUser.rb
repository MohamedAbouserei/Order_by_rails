class OrderUser < ApplicationRecord
    belongs_to :forder, class_name: "forder", foreign_key: "forder_id"
    belongs_to :model, class_name: "Model", foreign_key: "model_id"
end
