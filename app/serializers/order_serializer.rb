class OrderSerializer < ActiveModel::Serializer
  attributes :id, :table_id, :status, :table, :line_items_with_item
end
