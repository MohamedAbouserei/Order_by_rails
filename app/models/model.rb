class Model < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forders, class_name: "Forder" , foreign_key: "model_id"
  has_many :notifcations, class_name: "Notifcation"
  has_many :tasks
  def tasks
    Friend.where("request_id = ? OR reciver_id = ?", self.id, self.id)
  end
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |model|
      model.username = auth.info.name
      model.email = auth.info.email
      model.password = SecureRandom.hex
    end
  end
end
