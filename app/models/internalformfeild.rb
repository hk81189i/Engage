class Internalformfeild < ActiveRecord::Base
belongs_to :internalform
belongs_to :customftype
belongs_to :customf
has_many :dropboxefeilds
end
