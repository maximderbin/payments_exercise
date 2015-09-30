require 'rails_helper'

RSpec.describe LoanPayments::Service, type: :lib do
  let(:loan) { create(:loan) }
  let(:loan_payment) { build(:loan_payment, loan: loan) }
  let(:invalid_loan_payment) { build(:invalid_loan_payment, loan: loan) }
  let(:service) { described_class.new(loan_payment) }

  describe '#create' do
    subject { service.create(attributes) }
    let(:attributes) { { amount: loan_payment.amount } }

    context 'when valid attribites are passed' do
      it { expect{ subject }.to change(LoanPayment, :count).by(1) }
      it { is_expected.to be_truthy }
    end

    context 'when invalid attributes are passed' do
      let(:attributes) { { amount: invalid_loan_payment.amount } }

      it { expect{ subject }.not_to change(LoanPayment, :count) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#as_json' do
    let(:loan_payment) { create(:loan_payment, loan: loan) }

    subject { service.as_json }

    its(['id'])         { is_expected.to eq loan_payment.id }
    its(['amount'])     { is_expected.to eq loan_payment.amount }
    its(['created_at']) { is_expected.to eq loan_payment.created_at }
  end
end
