class User < ActiveRecord::Base
has_many :pplans
has_many :products
belongs_to :sale
has_many :batches
belongs_to :admin
belongs_to :owner
belongs_to :bd

  scope :tsr_month, ->(month) { where("MONTH(saledate) = ?" ,month).sum :selling_price}

end
