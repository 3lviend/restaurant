class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :quantity, :complete
end
