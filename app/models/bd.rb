class Bd < ActiveRecord::Base
has_many :users
has_many :contacts
end
