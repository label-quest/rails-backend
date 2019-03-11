class Label < ApplicationRecord
  belongs_to :user
  belongs_to :dataset_class
  belongs_to :image

  def dataset
    self.image.dataset
  end

end
