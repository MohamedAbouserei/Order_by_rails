class Orderuser < ApplicationRecord
    belongs_to :forder, class_name: "Forder"
    belongs_to :model, class_name: "Model"
end
