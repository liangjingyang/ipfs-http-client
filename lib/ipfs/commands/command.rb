require 'http'

module IPFS
  module Commands
    class Command

      def self.http_get(client, url, args=nil )
        request = client.user ? HTTP.basic_auth(user: client.user, pass: client.password) : HTTP
        request.get(*[url, args].compact).to_s  
      end
    end
  end
end
