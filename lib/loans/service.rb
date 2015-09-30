class Loans::Service < Services::Model
  object :loan
  json only: %i(id funded_amount), methods: :outstanding_balance
end
