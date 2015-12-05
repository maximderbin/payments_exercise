class LoanPayments::Service < Services::Model
  object :loan_payment
  json only: %i(id amount created_at)
end
