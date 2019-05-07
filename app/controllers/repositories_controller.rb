class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = '0115fbf57575bb7581bd'
       req.params['client_secret'] = 'a49f442e315876a59176593c769b2f6a60c52d87'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
       @repositories = body["items"]
   render 'search'
  end
end
