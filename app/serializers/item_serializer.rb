class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :board_id
end
