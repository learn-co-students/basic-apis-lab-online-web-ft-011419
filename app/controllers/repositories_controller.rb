class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.89236a68a2003bce"
    client_secret = "d80756e3271049233780d99bd109f350f19721b1"
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
