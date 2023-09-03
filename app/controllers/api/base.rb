module API
  class Base < Grape::API
    format :json
    version 'v1', using: :path
    mount V1::Base
    add_swagger_documentation api_version: 'v1', hide_documentation_path: true
  end
end