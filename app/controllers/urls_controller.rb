class UrlsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :show]

  def index
    redirect_to root_path
  end

  def show
    url = Url.where(generated_token: params[:generated_token]).first
    redirect_to url.base_url
  end

  def create
    @url = Url.new(url_params)
    set_token
    if @url.save
      @saved_url = @url
      @url = Url.new
    end
    render 'pages/home'
  end

  private

  def set_token
    token = Url.generate_token until token && Url.where(generated_token: token).empty?
    @url.generated_token = token
  end

  def url_params
    params.require(:url).permit(:base_url)
  end
end
