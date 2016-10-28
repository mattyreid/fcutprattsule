require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET profile" do
    it "returns http success" do
      get :profile
      expect(response).to be_success
    end
  end

  describe "GET explore" do
    it "returns http success" do
      get :explore
      expect(response).to be_success
    end
  end

  describe "GET search" do
    it "returns http success" do
      get :search
      expect(response).to be_success
    end
  end

end
