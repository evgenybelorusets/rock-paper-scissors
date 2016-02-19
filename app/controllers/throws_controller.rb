class ThrowsController < ApplicationController
  rescue_from InvalidSignError do |exception|
    Rails.logger.error(exception)
    redirect_to root_url
  end

  def create
    sign = Sign.new(params[:sign])
    @result = Result.new(sign)
  end
end
