class ApiController < ApplicationController
  # before_action :valid_parameters?
  include BeforeAction
  def index
    # モデル データを取ってくる
    @headlines = Headline.all
    # 出力
    render json: @headlines
    # render :status => 200
    # send_data(
    #   csv_data,
    #   type: 'text/csv; charset=utf-8',
    #   filename: "test.csv"
    # )
  end

  private
    def valid_parameters?
      unless params[:id]
        @errors = [["bad_request", 500]]
        render json: @errors, status: 500
      end
    end

    # 勉強用
    require 'csv'
    def csv_data
      CSV.generate(row_sep: "\r\n") do |csv|
        csv << ['hoge']
      end
    end
end
