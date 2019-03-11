class Image < ApplicationRecord
  belongs_to :dataset
  has_many :labels
end
