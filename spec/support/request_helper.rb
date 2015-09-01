module Requests
  
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module Extensions

    # custom headers such as multi-tenancy or versioning would be done here
    def set_headers(incoming_headers)
      incoming_headers = {} if incoming_headers.nil?
      # tenant_token = "my_token"
      # headers ||= {'HTTP_X_API_TENANT' => "#{tenant_token}"}
      # headers.merge(incoming_headers)
    end

    def post(path, parameters = nil, headers_or_env = nil)
      headers_or_env = set_headers(headers_or_env)
      super(path, parameters, headers_or_env)
    end

    def patch(path, parameters = nil, headers_or_env = nil)
      headers_or_env = set_headers(headers_or_env)
      super(path, parameters, headers_or_env)
    end

    def put(path, parameters = nil, headers_or_env = nil)
      headers_or_env = set_headers(headers_or_env)
      super(path, parameters, headers_or_env)
    end

    def get(path, parameters = nil, headers_or_env = nil)
      headers_or_env = set_headers(headers_or_env)
      super(path, parameters, headers_or_env)
    end

    def delete(path, parameters = nil, headers_or_env = nil)
      headers_or_env = set_headers(headers_or_env)
      super(path, parameters, headers_or_env)
    end

  end

end