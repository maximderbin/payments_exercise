class Loan < ActiveRecord::Base
  has_many :payments, class_name: 'LoanPayment'

  validates :funded_amount, presence: true
  validates :funded_amount, numericality: { greater_than: 0 }

  def outstanding_balance
    funded_amount - payments_amount
  end

  private def payments_amount
    payments.sum(:amount)
  end
end
