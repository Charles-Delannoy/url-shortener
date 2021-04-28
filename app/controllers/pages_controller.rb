class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @url = Url.new
    @test = params['created_url']
  end
end
