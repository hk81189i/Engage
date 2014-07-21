class AdminsController < ApplicationController

def index
  if params[:approved] == "false"
    @users = Contact.find_all_by_approved(false)
  else
    @users = Contact.all
  end
end


end
