class Item < ActiveRecord::Base
  has_many :line_items

  validates_presence_of :name, :detail_of_item, :price, :portion, :type_of_item
  validates :price, :portion, numericality: true
  validates :name, uniqueness: true

  # def self.search(term)
  #   # where('LOWER(title) LIKE :term OR LOWER(author) LIKE :term', term: "%#{term.downcase}%")
  #   # where('LOWER(name) LIKE :term', term: "%{term.downcase}%" )
  #   # where('LOWER(name) LIKE :term', term: "%{term.downcase}%" )
  # end

end
