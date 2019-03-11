class Dataset < ApplicationRecord
  belongs_to :customer
  has_many :images
  has_many :dataset_classes
  has_many :labels, through: :images

  def self.labels_at(day, dataset_id)
    num_of_labels = Label.all.map { |label| (label.created_at.to_date == day.to_date and label.image.dataset.id == dataset_id) ? 1 : 0}.to_a.sum
    return num_of_labels
  end
end
