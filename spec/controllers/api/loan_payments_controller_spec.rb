require 'rails_helper'

RSpec.describe Api::LoanPaymentsController, type: :controller do
  let(:loan) { create(:loan) }
  let(:loan_payment) { build(:loan_payment) }
  let(:invalid_loan_payment) { build(:invalid_loan_payment) }

  describe '#index' do
    it 'responds with status ok' do
      get(:index, loan_id: loan.id)
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    let(:loan_payment) { create(:loan_payment, loan: loan) }

    it 'responds with status ok' do
      get(:show, loan_id: loan.id, id: loan_payment.id)
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    context 'when valid params are passed' do
      it 'responds with status ok' do
        post(:create, loan_payment: { amount: loan_payment.amount }, loan_id: loan.id)
        expect(response.status).to eq(200)
      end
    end

    context 'when invalid params are passed' do
      before do
        post(:create, loan_payment: { amount: invalid_loan_payment.amount }, loan_id: loan.id)
      end

      subject { response }

      its(:status) { is_expected.to eq(422) }
      it { expect(JSON.parse(response.body)['errors']).not_to be_blank }
    end
  end
end
