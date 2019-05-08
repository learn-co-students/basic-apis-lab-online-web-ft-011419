class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.3857ed525c1101ff'
      req.params['client_secret'] = 'd1671816068d394255ff824e36934b0dae72a265'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash['items']

    render 'search'
  end
end
