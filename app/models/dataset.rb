class Dataset < ApplicationRecord
  belongs_to :customer
  has_many :images
  has_many :dataset_classes
end
