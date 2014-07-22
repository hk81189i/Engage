class Dropbox < ActiveRecord::Base
belongs_to :customftype
belongs_to :internalformfeild
has_many :dropboxfeilds
end
