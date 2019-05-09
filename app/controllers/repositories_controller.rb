class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   # binding.pry
   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ENV["Client ID" ]
      req.params['client_secret'] = ENV["Client Secret"]
     req.params['q'] = params[:query]
    
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
