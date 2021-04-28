class UrlsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    @url = Url.new(url_params)
    raise
  end

  private

  def url_params
    params.require(:url).permit(:base_url)
  end
end
