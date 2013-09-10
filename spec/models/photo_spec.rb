require 'spec_helper'

describe Photo do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, :user => @user)
    @attr = { :description => 'photo description' }
  end
  describe 'album associations' do
    before(:each) do
      @photo = @album.photos.create(@attr)
    end

    it 'should have a photo attribute' do
      @photo.should respond_to(:album)
    end

    it 'should have the right associated photo' do
      @photo.album.should == @album
    end
  end
end
