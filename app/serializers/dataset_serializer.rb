class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :goal, :folder_path
  has_one :customer
end
