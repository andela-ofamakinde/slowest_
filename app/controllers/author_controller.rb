class AuthorController < ApplicationController

  def index
    @authors = Author.includes(:articles).all.paginate(:page => params[:page], :per_page => 30)
  end 
end
