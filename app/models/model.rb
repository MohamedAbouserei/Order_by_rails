class Model < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forders, class_name: "Forder" , foreign_key: "model_id"

  has_many :friends, dependent: :destroy
  has_one :
end
