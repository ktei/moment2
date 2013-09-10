require 'spec_helper'

describe Album do
  describe 'photo associations' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @album = FactoryGirl.create(:album, :user => @user)
      @photo1 = FactoryGirl.create(:photo, :album => @album)
      @photo2 = FactoryGirl.create(:photo, :album => @album)
    end

    it 'should have a photos attribute' do
      @album.should respond_to(:photos)
    end

    it 'should have the right photos in the right order' do
      @album.photos.should == [@photo2, @photo1]
    end
  end
end
