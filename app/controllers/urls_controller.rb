class UrlsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :show]

  def index
    redirect_to root_path unless current_user
    init_index
  end

  def show
    url = Url.where(generated_token: params[:generated_token]).first
    redirect_to url.base_url
  end

  def create
    @url = Url.new(url_params)
    set_token if @url.generated_token.empty?
    @url.user = current_user if current_user
    if @url.save
      @saved_url = @url
      @url = Url.new
    end
    if current_user
      init_index
      render :index
    else
      render 'pages/home' unless current_user
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  private

  def init_index
    @url = Url.new
    @urls = Url.where(user: current_user)
  end

  def set_token
    token = Url.generate_token until token && Url.where(generated_token: token).empty?
    @url.generated_token = token
  end

  def url_params
    params.require(:url).permit(:base_url, :generated_token)
  end
end
