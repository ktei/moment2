require 'spec_helper'

describe PhotosController do
  describe "POST 'create'" do
    describe 'for non-signed-in user' do
      it 'should deny access' do
        post :create
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe 'for signed-in user' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @album = FactoryGirl.create(:album, :user => @user)
        sign_in_as(@user)
      end
    end
  end
end
