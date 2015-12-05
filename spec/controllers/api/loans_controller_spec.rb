require 'rails_helper'

RSpec.describe Api::LoansController, type: :controller do
  let(:loan) { create(:loan) }

  describe '#index' do
    it 'responds with status ok' do
      get(:index)
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    it 'responds with status ok' do
      get(:show, id: loan.id)
      expect(response.status).to eq(200)
    end
  end
end
