class Invoice < ActiveRecord::Base
has_many :collection
belongs_to :pplan
belongs_to :user
belongs_to :contact
belongs_to :sale
end
