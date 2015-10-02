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

  describe 'DELETE #destroy' do
    it 'destroys the person' do
      delete :destroy, {id: @item.id}
      expect(Item.count).to eq(0)
    end
  end

  describe 'POST #create' do
    it 'creates a new item' do
      delete :destroy, {id: @item.id}
      expect(Item.count).to eq(0)
      create_params = {item: {name: 'Created', description: 'Woot', category: 'Awesome'}}
      post :create, create_params
      expect(Item.count).to eq(1)
      expect(Item.last.name).to eq('Created')
    end

    it 'does not add item without name' do
      delete :destroy, {id: @item.id}
      expect(Item.count).to eq(0)
      create_params = {item: {name: nil, description: 'Woot', category: 'Awesome'}}
      post :create, create_params
      expect(Item.count).to eq(0)
    end

    it 'renders the new template on error' do
      delete :destroy, {id: @item.id}
      expect(Item.count).to eq(0)
      create_params = {item: {name: nil, description: 'Woot', category: 'Awesome'}}
      post :create, create_params
      expect(response).to render_template('new')
    end
  end

  describe 'GET #create_copy' do
    it 'creates an item copy' do
      item_copy = Item.new
      item_copy = @item.copy_item(user.id, @item.name, @item.description, @item.category, @item.image)
      expect(item_copy.name).to eq('MyString')
    end
  end

  describe 'GET #travel' do
    it 'returns items of the correct category' do
      get :travel
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

  describe 'GET #life_choices' do
    it 'returns items of the correct category' do
      get :life_choices
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

  describe 'GET #food_drink' do
    it 'returns items of the correct category' do
      get :food_drink
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

  describe 'GET #career' do
    it 'returns items of the correct category' do
      get :career
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

  describe 'GET #family' do
    it 'returns items of the correct category' do
      get :family
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

  describe 'GET #other' do
    it 'returns items of the correct category' do
      get :other
      expect(Item.by_category('MyString').count).to eq(1)
    end
  end

end
