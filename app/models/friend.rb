class Friend < ApplicationRecord
    belongs_to :model
    enum status: { accept: 0, deny: 1, none: 2 }
    has_many :fgroups
end
