require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all products as @products" do
      product = FactoryGirl.create(:product)
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

  end

end
