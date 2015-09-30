class Api::LoanPaymentsController < Api::ApplicationController
  def index
    render json: LoanPayments::Service.json_list(scope)
  end

  def show
    render json: service.as_json
  end

  def create
    if service.create(permitted_params)
      render json: service.as_json
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private def loan
    @loan ||= Loan.find(params.require(:loan_id))
  end

  private def scope
    loan.payments
  end

  private def resource
    @resource ||= if params[:id].present?
      scope.find(params[:id])
    else
      scope.build
    end
  end

  private def service
    @service ||= LoanPayments::Service.new(resource)
  end

  private def permitted_params
    params.require(:loan_payment).permit(:amount)
  end
end
