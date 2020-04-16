class Forder < ApplicationRecord
    validates :meal, :presence => true, :length => { :maximum => 50, :minimum => 3 }
    validates :resturant, :presence => true, :length => { :maximum => 50 , :minimum => 3}
    # validates :image, :presence => true, :length => { :maximum => 50 }
    belongs_to :model, class_name: "Model", foreign_key: "model_id"
    has_many :meals, class_name: "Orderuser"
    validate :file_format, if: :image?

  def file_format
    p self.image
    unless valid_extension? self.image
      errors[:document] << "Invalid image format."
    end
  end

  def valid_extension?(filename)
    ext = File.extname(filename)
    %w( .jpg .jpeg .png ).include? ext.downcase
  end


end
