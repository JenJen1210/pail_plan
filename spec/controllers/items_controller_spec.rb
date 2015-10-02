require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item) }
  before(:each) do
    sign_in user
    @item = item
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: @item.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'updates an item' do
      update_params = {id: item.id, item: {name: 'updated'}}
      put :update, update_params
      @item = @item.reload
      expect(@item.name).to eq('updated')
    end

    it 'renders edit template on error' do
      update_params = {id: item.id, item: {name: nil}}
      put :update, update_params
      expect(response).to render_template('edit')
    end

    it 'will not save without a name' do
      update_params = {id: item.id, item: {name: nil}}
      put :update, update_params
      @item = @item.reload
      expect(@item.name).to eq('MyString')
    end

  end

end
