require 'spec_helper'

describe AlbumsController do
  render_views

  describe 'access control' do
    describe "GET 'index'" do
      it 'should deny access without login' do
        get :index
        response.should redirect_to(sign_in_path)
      end

      it 'should grant access when login' do
        sign_in
        get :index
        response.should be_success
        response.should have_selector('li.active', :content => 'Albums')
      end
    end

    describe "GET 'new'" do
      it 'should deny access without login' do
        get :new
        response.should redirect_to(sign_in_path)
      end

      it 'should grant access when login' do
        sign_in
        get :new
        response.should be_success
        response.should have_selector('li.active', :content => 'Create album')
      end
    end
  end

  describe 'for signed-in users' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @album1 = FactoryGirl.create(:album, :user => @user, :caption => FactoryGirl.generate(:caption))
      @album2 = FactoryGirl.create(:album, :user => @user, :caption => FactoryGirl.generate(:caption))
      sign_in_as(@user)
    end

    describe "GET 'index'" do
      it "should show current user's albums" do
        get :index
        response.should be_success
        response.should have_selector('div', :content => @album1.caption)
        response.should have_selector('div', :content => @album2.caption)
      end

      it "should show 'no albums' notification if current user has no album" do
        user_without_album = FactoryGirl.create(:user, :email => FactoryGirl.generate(:email))
        sign_in_as(user_without_album)
        get :index
        response.should be_success
        response.should have_selector('div.alert', :content => 'no album')
      end
    end

    describe "POST 'create'" do
      before(:each) do
        @attr = {caption: FactoryGirl.generate(:caption), description: 'album description'}
      end
      it 'should fail with empty caption' do
        post :create, :album => @attr.merge({caption: ''})
        response.should render_template('albums/new')
        response.should have_selector('div.alert')
      end

      it 'should fail with duplicate caption' do
        post :create, :album => @attr.merge({caption: @album1.caption})
        response.should render_template('albums/new')
        response.should have_selector('div.alert')
      end

      it 'should fail with caption too long' do
        post :create, :album => @attr.merge({caption: 'a' * 151})
        response.should render_template('albums/new')
        response.should have_selector('div.alert')
      end

      it 'should fail with description too long' do
        post :create, :album => @attr.merge({description: 'a' * 501})
        response.should render_template('albums/new')
        response.should have_selector('div.alert')
      end

      it 'should succeed with valid data' do
        lambda do
          post :create, :album => @attr
        end.should change(Album, :count).by(1)
        response.should redirect_to(library_path)
      end
    end
    
    describe "PUT 'update'" do
      before(:each) do
        @attr = {caption: FactoryGirl.generate(:caption), description: 'album description'}
      end

    end
  end
end
