require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'factories' do
    subject { build(:loan) }

    it { is_expected.to be_valid }
  end

  describe '#outstanding_balance' do
    let(:loan) { create(:loan, funded_amount: 100.00) }

    before { create(:loan_payment, loan: loan, amount: 49.99) }

    subject { loan.outstanding_balance }

    it { is_expected.to eq 50.01 }
  end
end
