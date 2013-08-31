require 'spec_helper'

describe 'Users' do
  describe 'sign up' do
    describe 'failure' do
      it 'should not create new user' do
        lambda do
          visit sign_up_path
          fill_in 'Email', :with => ''
          fill_in 'Password', :with => ''
          click_button
          response.should render_template('users/new')
          response.should have_selector('div.alert')
        end.should_not change(User, :count)
      end
    end

    describe 'success' do
      it 'should create a new user' do
        lambda do
          visit sign_up_path
          fill_in 'Email', :with => 'user@example.com'
          fill_in 'Password', :with => 'foobar'
          click_button
          response.should render_template('albums/index')
        end.should change(User, :count).by(1)
      end
    end
  end

  describe 'sign in/out' do
    describe 'failure' do
      it 'should not sign a user in' do
        visit sign_in_path
        fill_in 'session_email', :with => ''
        fill_in 'session_password', :with => ''
        click_button
        response.should have_selector('div.alert')
      end
    end

    describe 'success' do
      it 'should sign a user in and out' do
        user = FactoryGirl.create(:user)
        visit sign_in_path
        fill_in 'session_email', :with => user.email
        fill_in 'session_password', :with => user.password
        click_button
        controller.should be_signed_in
        click_link 'Sign out', :method => :delete
        controller.should_not be_signed_in
      end
    end
  end
end
