class LabelSerializer < ActiveModel::Serializer
  attributes :id, :x_pos, :y_pos
  has_one :user
  has_one :dataset_class
  has_one :image
end
