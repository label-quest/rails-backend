class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :password
end
