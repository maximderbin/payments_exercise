FactoryGirl.define do
  factory :loan_payment do
    loan
    amount { 50.00 }

    factory :invalid_loan_payment do
      amount { -1 }
    end
  end
end
