class Image < ApplicationRecord
  belongs_to :dataset
  has_many :labels

  def majority_class
    if self.labels.count > 0
      majority_dataset_class_id = mode(self.labels.map { |label| label.dataset_class.id }.to_a)[0]

      return DatasetClass.find_by(id: majority_dataset_class_id)
    else
      return -1
    end
  end

  def mode(array)
    array.group_by{ |e| e }.group_by{ |k, v| v.size }.max.pop.map{ |e| e.shift }
  end

end
