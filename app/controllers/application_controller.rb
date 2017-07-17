class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    flash[:alert] = 'Você não está autorizado a realizar essa ação.'
    redirect_to(request.referrer || root_path)
  end
end
