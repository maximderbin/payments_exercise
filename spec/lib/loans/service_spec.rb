require 'rails_helper'

RSpec.describe Loans::Service, type: :lib do
  let(:loan) { create(:loan) }
  let(:service) { described_class.new(loan) }

  describe '#as_json' do
    subject { service.as_json }

    its(['id'])                  { is_expected.to eq loan.id }
    its(['funded_amount'])       { is_expected.to eq loan.funded_amount }
    its(['outstanding_balance']) { is_expected.to eq loan.outstanding_balance }
  end
end
