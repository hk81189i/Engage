class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :date_format
  protect_from_forgery with: :exception
  before_filter :only_authenticated_admins_are_welcome
  skip_before_filter :check_subdomain!, if: :devise_controller?

  


  def only_authenticated_admins_are_welcome
    if(!admin_signed_in?)
       unless params[:controller] == 'devise/sessions' or params[:controller] == 'devise/registrations'
         redirect_to "/admins/sign_in"
       end
    end
  end


def date_format
    Date::DATE_FORMATS[:default]=  :saledate || "%d/%m/%Y"
  end





end
