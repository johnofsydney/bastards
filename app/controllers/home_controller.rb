class HomeController < ApplicationController
  def index
    @foo = 'foo'
  end

  def search
    search_terms = params['query']['search_terms']
    @results = PgSearch.multisearch(search_terms)
  end
end

