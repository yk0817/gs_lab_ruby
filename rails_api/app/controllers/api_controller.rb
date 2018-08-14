class ApiController < ApplicationController
  # before_action :valid_parameters
  include BeforeAction
  def index
    @headlines = Headline.all
    render json: @headlines
  end

  # private
  #   def valid_parameters?
  #     unless params[:id]
  #       @errors = [["bad_request", 500]]
  #       render json: @errors, status: 500
  #     end
  #   end
end
