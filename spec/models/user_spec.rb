require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is saves all fields exist" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(true)
    end

    it "is not valid if first name doesn't exist" do
      a_user = User.new(last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if last name doesn't exist" do
      a_user = User.new(first_name:"Ali", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if email doesn't exist" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if email is not unique and case sensitive" do
      b_user = User.new(first_name:"Ali", last_name:"Bas", email: "Ali@Ali.Com", password:"12qw", password_confirmation:"12qw")
      b_user.save
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if password doesn't exist" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password_confirmation:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if password-confirmation doesn't exist" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if password doesn't match" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"wertqw")
      a_user.save
      expect(a_user.save).to eq(false)
    end

    it "is not valid if password valid if password is shorter than 4 chars" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12q", password_confirmation:"12q")
      a_user.save
      expect(a_user.save).to eq(false)
    end

  end


  describe '.authenticate_with_credentials' do
    it "is finding the user and authenticates with credentials" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.authenticate_with_credentials("ali@ali.com", "12qw")).to eq(a_user)
    end

    it "is finding the user and authenticates with credentials" do
      a_user = User.new(first_name:"Ali", last_name:"Bas", email: "ali@ali.com", password:"12qw", password_confirmation:"12qw")
      a_user.save
      expect(a_user.authenticate_with_credentials("ali@ali.com", "12qsdeff")).to eq(nil)
    end
  end

end