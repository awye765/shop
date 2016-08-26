require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  xdescribe "GET #create" do
    it "returns http success" do
      get :create, order_item: FactoryGirl.attributes_for(:product)
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
