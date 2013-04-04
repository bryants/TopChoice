require 'pusher'
Pusher.app_id = '40867'
Pusher.key = 'fadea4049d9491041f20'
Pusher.secret = '2ac7778b03d7d2f277af'

class EntriesController < ApplicationController
  def index
    @entries = Entry.get_results
  end

  def create
    Entry.create(:choice =>params[:choice])
    Pusher['app-dev-real_time-test'].trigger('data-changed', Entry.get_results.to_json)
    redirect_to '/'
  end
end
