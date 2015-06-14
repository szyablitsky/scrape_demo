class ImeiController < ApplicationController
  protect_from_forgery with: :null_session

  def show
  end

  def check
    status = CoverageCheckService.check(params[:imei])
    render json: status
  end
end
