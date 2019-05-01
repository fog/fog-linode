module Fog
  module Linode
    # This module encapsulates common logic for loading paginated,
    # filterable collections from the Linode API
    module PaginatedCollection
      def make_paginated_request(endpoint, options = {})
        params, filters = extract_params_and_filters(options)

        response = make_request(endpoint, params, filters)
        entities = response.body['data']

        unless params[:page]
          (2..response.body['pages']).each do |page|
            response = make_request(endpoint, params.merge(page: page), filters)
            entities.concat response.body['data']
          end
        end

        entities
      end

      private

      def extract_params_and_filters(options)
        params = options.dup
        filters = params.delete(:filters)
        [params, filters]
      end

      def make_request(endpoint, params, filters)
        headers = {}
        headers['X-Filter'] = Fog::JSON.encode(filters) if filters

        request(
          expects: [200],
          method: 'GET',
          path: endpoint,
          query: params,
          headers: headers
        )
      end
    end
  end
end
