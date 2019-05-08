class RepositoriesController < ApplicationController

  def search
    # @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    #   req.params['client_id'] = "Iv1.ab4312779c000b79"
    #   req.params['client_secret'] = "fbad037aa3923da6780bafa0d29aa0ecc5b61579"
    #   binding.pry
    #   req.params['q'] = params[:query]
    # end
    # render 'search'
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.ab4312779c000b79"
      req.params['client_secret'] = "fbad037aa3923da6780bafa0d29aa0ecc5b61579"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
