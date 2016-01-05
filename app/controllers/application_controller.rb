class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_order(params)
    order = 'id'
    if params.key?(:sort)
      orders = []
      params[:sort].each { |sort| orders << "#{sort[1][:field]} #{sort[1][:dir]}" }
      order = orders.join(', ')
    end
    order
  end

end
