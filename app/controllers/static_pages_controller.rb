class StaticPagesController < ApplicationController

  def home
    return unless params[:username]
    begin
      @user = flickr.people.findByUsername username: params[:username]
      @photostream = flickr.people.getPublicPhotos user_id: @user['id']
    rescue FlickRaw::FailedResponse
      flash[:danger] = 'User not found.'
    end
  end
end
