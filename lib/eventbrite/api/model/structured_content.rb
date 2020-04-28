module Eventbrite
  module Api
    module Model
      class StructuredContent < Base
      	def model_route
          'events/:event_id/structured_content'
        end

        def create(object, opts={})
          @client.connection.post(url(opts, '1/'), {:headers => @client.headers, :body => object.to_json})
        end

        def update(page_version, object, opts={})
          page_version = page_version.to_s
          page_version << '/' unless page_version.match? /\/$/
          @client.connection.post(url(opts, page_version), {:headers => @client.headers, :body => object.to_json})
        end
      end
    end
  end
end
