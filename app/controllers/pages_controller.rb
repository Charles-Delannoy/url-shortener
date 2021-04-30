class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @url = Url.new
    redirect_to urls_path if current_user
  end
end
