require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'model attributes' do
    it { should respond_to(:user_name) }
    it { should respond_to(:about_me) }
    it { should respond_to(:location) }
    it { should have_many(:items) }
  end

end
