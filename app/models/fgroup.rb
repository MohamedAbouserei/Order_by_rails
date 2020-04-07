class Fgroup < ApplicationRecord
    has_many :groupUsers, class_name: "GroupUser"
end