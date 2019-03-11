class Label < ApplicationRecord
  belongs_to :user
  belongs_to :dataset_class
  belongs_to :image
end
