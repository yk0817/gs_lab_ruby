class ApiController < ApplicationController
  def index
    @headlines = Headline.all
    render json: @headlines
  end
end
