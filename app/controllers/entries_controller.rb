class EntriesController < ApplicationController
  def index
    @entries = Entry.get_results
  end

  def create
    Entry.create(:choice =>params[:choice])
    redirect_to '/'
  end
end
