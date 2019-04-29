module Fog
  module Linode
    # Base class for a Linode service
    # Defines common logic for setting up and using a connection
    class Service
      def initialize(options = {})
        request_defaults = {
          path_prefix: '/v4',
          headers: {
            'Authorization' => "Bearer #{options[:linode_token]}"
          }
        }

        add_user_agents(options[:user_agents])
        @connection = Fog::Core::Connection.new('https://api.linode.com',
                                                options[:persistent],
                                                request_defaults)
      end

      private

      def add_user_agents(custom_user_agents)
        default_user_agent = "fog-linode/#{Fog::Linode::VERSION}"
        user_agents = (custom_user_agents || []).push(default_user_agent)
        user_agents.each do |user_agent|
          Fog::Core::Connection.add_user_agent(user_agent)
        end
      end

      def request(params)
        @connection.request(params)
      end
    end
  end
end
