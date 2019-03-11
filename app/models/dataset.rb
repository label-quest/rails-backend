class Dataset < ApplicationRecord
  belongs_to :customer
  has_many :images
  has_many :dataset_classes
  has_many :labels, through: :images

  def majority_class
    chosen_dataset_class_ids = []
    self.labels.each do |label|
      chosen_dataset_class_ids.push(label.dataset_class.id)
    end

    majority_label_id = chosen_dataset_class_ids.max_by{|x| chosen_dataset_class_ids.count(x) }
    return Label.find_by(id: majority_label_id)
  end
end
