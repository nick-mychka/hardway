class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :created_at
end
