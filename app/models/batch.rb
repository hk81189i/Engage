class Batch < ActiveRecord::Base


has_many :sales
has_many :pplans
has_many :collections
belongs_to :pplans
belongs_to :user
has_many :contacts
belongs_to :product

end


