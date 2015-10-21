class Order < ActiveRecord::Base
  belongs_to :table
  has_many :line_items

  # for api
  def line_items_with_item
  	new_line_items = []
    self.line_items.each do |line|
      n_line_items = line.attributes
      n_line_items[:items] = line.item
      new_line_items << n_line_items
    end
    return new_line_items
  end

end
 