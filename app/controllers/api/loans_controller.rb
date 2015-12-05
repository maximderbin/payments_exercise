class Api::LoansController < Api::ApplicationController
  def index
    render json: Loans::Service.json_list(scope)
  end

  def show
    render json: service.as_json
  end

  private def scope
    Loan.all
  end

  private def resource
    @resource ||= if params[:id].present?
      Loan.find(params[:id])
    else
      Loan.new
    end
  end

  private def service
    @service ||= Loans::Service.new(resource)
  end
end
