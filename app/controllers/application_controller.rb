class ApplicationController < ActionController::Base
  def index
    @flats = Flat.all
  end
end
