class RepositoriesController < ApplicationController
  def search; end

  def github_search
    begin
        @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 'Iv1.649fab95d750853a'
          req.params['client_secret'] = '16c842b0bd472907de96f9348394a28d54dbc77f'
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @repos = body['items']
        else
          @error = body['message']
        end
    rescue Faraday::ConnectionFailed
      @error = 'There was a timeout. Please try again.'
      end
    render 'search'
  end
end
