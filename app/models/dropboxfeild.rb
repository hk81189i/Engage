
class Dropboxfeild < ActiveRecord::Base
belongs_to :dropboxfeild


def self.dropbox_items(id)
@dropbox =  Dropbox.where(:internalform_id => id).first.id
@dropboxfeilds = Dropboxfeilds.where(:dropbox_id => @dropbox)


end



end
