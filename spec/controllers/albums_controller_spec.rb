require 'spec_helper'

describe AlbumsController do
  render_views

  describe 'access control' do
    it 'should deny access to index without login' do
      get :index
      response.should redirect_to(sign_in_path)
    end

    it 'should grant access to index when login' do
      sign_in
      get :index
      response.should be_success
    end
  end
end
