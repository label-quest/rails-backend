class Dataset < ApplicationRecord
  belongs_to :customer
  has_many :images
  has_many :dataset_classes
  has_many :labels, through: :images

  def self.labels_at(day, dataset_id)
    num_of_labels = Label.all.map { |label| labellabel.image.dataset.id == dataset_id ? 1 : 0}.to_a.sum
    return num_of_labels
  end
end
