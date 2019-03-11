class ImageSerializer < ActiveModel::Serializer
  attributes :id, :file_path
  has_one :dataset
end
