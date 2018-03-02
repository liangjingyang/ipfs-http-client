require 'http'
require 'json'
require 'ipfs/content/node'

module IPFS
  module Commands
    class LS < IPFS::Commands::Command
      def self.call(client, node)
        parse query(client, node)
      end

      private

      def self.query(client, node)
        http_get(client, "#{client.api_url}/ls?arg=#{node}&stream-channels=true")
      end

      def self.parse(response)
        Content::Node.parse_array JSON.parse(response)['Objects']
      end
    end
  end
end
