require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe "GET #index" do
    context "GET with params id: 1" do
      let(:params){{ id: 1 }}
      subject { get :index, params: params }
      it "should be success" do
        expect(subject).to be_successful
        expect(subject.status).to eq 200
      end
    end

    context "GET without params " do
      subject { get :index }
      it "should not be success" do
        expect(subject).not_to be_successful
        expect(subject.status).to eq 500
      end
    end
  end
end
