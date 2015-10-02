require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'model attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:category) }
    it { should respond_to(:likes) }
    it { should respond_to(:incomplete) }
    it { should respond_to(:image) }
    it { should belong_to(:user) }
    it { should validate_presence_of :name }
  end

  describe 'model methods' do
    before(:each) do
      @item = FactoryGirl.create(:item)
    end

    it 'creates a copy of an item' do
      @item_copy = @item.copy_item(1, @item.name, @item.description, @item.category, @item.image)
      expect(@item_copy.name).to eq('MyString')
    end

    it 'returns items of correct category' do
      expect(Item.by_category('MyString')[0].category).to eq('MyString')
    end
  end
end
