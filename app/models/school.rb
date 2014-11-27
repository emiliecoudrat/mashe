class School < ActiveRecord::Base
  include AlgoliaSearch
  algoliasearch do
    attributesToIndex ['address', 'name', 'city']
    # associated index settings can be configured from here
  end
end
