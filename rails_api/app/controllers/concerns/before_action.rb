module BeforeAction
  extend ActiveSupport::Concern

  included do
    before_action :valid_parameters?
  end

    private
    def valid_parameters?
      unless params[:id]
        @errors = [["bad_request", 500]]
        render json: @errors, status: 500
      end
    end
end
