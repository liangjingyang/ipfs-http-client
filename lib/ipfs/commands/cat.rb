require 'http'

module IPFS
  module Commands
    class Cat < IPFS::Commands::Command
      def self.call(client, node)
        http_get(client, "#{client.api_url}/cat?arg=#{node}&stream-channels=true")
      end
    end
  end
end
