class Order < ActiveRecord::Base
  belongs_to :table
  has_many :line_items

  # def self.search_keywords_period(params_date)
  #   dates = params_date.split(" - ")
  #   date_1 = dates[0]
  #   date_2 = dates[1]
    # where('date between ? and ?', date_1.to_date, date_2.to_date)
  # end

  def self.search(params_date)
    # debugger
    # params[:search][:date_from]
    date_from = params_date[:date_from] unless params_date.nil?
    date_to = params_date[:date_to] unless params_date.nil?
    where('created_at between ? and ? ', date_from, date_to)
    # Order.where('created_at between ? and ?', '2015-10-15 0:0:0', '2015-10-16 0:0:0')
  end
end
 