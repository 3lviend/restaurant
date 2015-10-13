class Order < ActiveRecord::Base
  belongs_to :table
  has_many :line_items
end
 