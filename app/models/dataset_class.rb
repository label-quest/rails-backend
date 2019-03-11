class DatasetClass < ApplicationRecord
  belongs_to :dataset
  has_many :labels
end
