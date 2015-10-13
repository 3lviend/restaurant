class Ingredient < ActiveRecord::Base
  # def self.items
  #   Item.all
  # end

  validates_presence_of :name, :quantity, :detail_of_quantity
  validates :name, uniqueness: true
  validates :quantity, numericality: true
end
