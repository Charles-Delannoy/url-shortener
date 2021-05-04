module UrlsHelper
  def saved_url_tag(saved_url)
    url = "#{root_url}#{saved_url.generated_token}"
    render 'pages/saved_url', url: url
  end
end
