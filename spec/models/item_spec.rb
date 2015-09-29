require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'model attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:category) }
    it { should respond_to(:likes) }
    it { should respond_to(:incomplete) }
    it { should belong_to(:user) }
  end
end
