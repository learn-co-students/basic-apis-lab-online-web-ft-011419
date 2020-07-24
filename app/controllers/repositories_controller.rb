class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'ee10d1882e628a69b85f'
      req.params['client_secret'] = 'c123ebd84143563e15f5d1ac97d017b238bd9348'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash["items"]
    render 'search'
  end
end
