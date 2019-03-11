class DatasetClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :dataset
end
