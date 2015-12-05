class LoanPayment < ActiveRecord::Base
  belongs_to :loan

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :loan_outstanding_balance_exceeds

  private def loan_outstanding_balance_exceeds
    if loan.outstanding_balance < amount
      errors.add :amount, :loan_outstanding_balance_exceeds
    end
  end
end
