module UrlsHelper

  def generated_url
    saved_url_tag(@saved_url) if @saved_url
  end

  def saved_url_tag(saved_url)
    url = "#{root_url}#{saved_url.generated_token}"
    render 'pages/saved_url', url: url
  end

  def url_card_tag(url)
    short_url = "#{root_url}#{url.generated_token}"
    render 'urls/url_card', url: url, short_url: short_url
  end
end
