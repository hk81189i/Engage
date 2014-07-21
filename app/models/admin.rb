class Admin < ActiveRecord::Base


def active_for_authentication? 
  super && approved? 
end 

def inactive_message 
  if !approved? 
    :not_approved 
  else 
    super # Use whatever other message 
  end 
end


has_many :sales
has_many :users
has_many :contacts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



after_create :send_admin_mail
def send_admin_mail
  #AdminMailer.new_user_waiting_for_approval(self).deliver
  
end

end
