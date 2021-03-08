require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is not valid if password doesn't exist" do
      a_user = User.new
      expect(a_user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
