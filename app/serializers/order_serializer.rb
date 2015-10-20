class OrderSerializer < ActiveModel::Serializer
  attributes :id, :table_id, :status
end
