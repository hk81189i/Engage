class Product < ActiveRecord::Base
has_many :sales
has_many :batches
belongs_to :user
belongs_to :contact
end
