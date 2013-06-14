module Rack
  class RedirectRequest < Exception
    attr_reader :location
    def initialize(location)
      @location = location
      super "redirect to #{location}"
    end
  end

  class Redirector
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue RedirectRequest => redirect
      [302, {'Location' => redirect.location}, []]
    end
  end
end
