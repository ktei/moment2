class PublicController < ApplicationController
  def home
    redirect_to library_path if signed_in?
  end
end