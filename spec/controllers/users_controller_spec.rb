require 'spec_helper'

describe UsersController do
  render_views

  describe 'access control' do
    describe "GET 'edit'" do
      it 'should deny access without login' do
        get :edit
        response.should redirect_to(sign_in_path)
      end

      it 'should grant access when login' do
        sign_in
        get :edit
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it 'should deny access without login' do
        put :update
        response.should redirect_to(sign_in_path)
      end
    end

    describe "PATCH 'update'" do
      it 'should deny access without login' do
        patch :update
        response.should redirect_to(sign_in_path)
      end
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @attr = { email: @user.email, first_name: @user.first_name, last_name: @user.last_name }
      sign_in_as(@user)
    end

    describe 'text data' do
      it 'should fail without email' do
        put :update, :user => @attr.merge({email: ''})
        response.should render_template('users/edit')
        response.should have_selector('div.alert')
      end

      it 'should fail with names too long' do
        put :update, :user => @attr.merge({first_name: 'a' * 51, last_name: 'b' * 51})
        response.should render_template('users/edit')
        response.should have_selector('div.alert')
      end

      it 'should succeed with valid data' do
        put :update, :user => @attr.merge({email: 'test@test.com', first_name: 'first_name', last_name: 'last_name'})
        response.should redirect_to(profile_path)
        flash[:success].should =~ /success/i
      end
    end

    describe 'image data' do
      it 'should succeed' do
        put :update, :user => @attr.merge({avatar: fixture_file_upload('images/profile.png', 'image/png')})
        response.should redirect_to(profile_path)
        flash[:success].should =~ /success/i
      end
    end
  end
end