require 'rails_helper'

RSpec.describe LoanPayment, type: :model do
  describe 'factories' do
    describe 'loan_payment' do
      subject { build(:loan_payment) }

      it { is_expected.to be_valid }
    end

    describe 'invalid_loan_payment' do
      subject { build(:invalid_loan_payment) }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'validations' do
    describe '#loan_outstanding_balance_exceeds' do
      let(:loan) { create(:loan, funded_amount: 100) }

      subject { build(:loan_payment, loan: loan, amount: 100.01) }

      it { is_expected.not_to be_valid }
    end
  end
end
