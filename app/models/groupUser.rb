class GroupUser < ApplicationRecord
    belongs_to :fgroup, class_name: "fgroup", foreign_key: "fgroup_id"
    belongs_to :model, class_name: "Model", foreign_key: "model_id"
end
