class Table < ActiveRecord::Base
  has_many :orders

  validates_presence_of :name

  validates :name, uniqueness: true


  #  for api
  def status
    return "available" if self.available == true
    return "not available"
  	# if self.available == true
  	# 	available = 'available'
  	# else 
  	# 	available = 'not available'
  	# end
  end
end
