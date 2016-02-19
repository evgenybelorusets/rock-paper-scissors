class ThrowsController < ApplicationController
  rescue_from InvalidSignError do
    head :unprocessable_entity
  end

  def create
    sign = Sign.new(params[:sign])
    @result = Result.new(sign)
  end
end
