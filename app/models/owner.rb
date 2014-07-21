class Owner < ActiveRecord::Base
has_many :sales
has_many :users
has_many :contact


end
