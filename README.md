##What's this
This is a simple redirector suited for Rack simple_router.

While <code>Rack::Recursive</code> requests another page internally, <code>Rack::Redirector</code> redirect to another page with 302 status code.

##Usage

####with simple_router

This is a simple sample that may not work but you will make sense of what can do with <code>Rack::Redirector</code>.

    #config.ru
    requrie 'rack/redirector'
    require 'simple_router'

    class MyApp

      include SimpleRouter::DSL
      
      get '/' do
        #do something..
      end

      get '/home' do
        authenticate
        #do something..
      end

      get '/input' do
        authenticate
        #show form and post to /create action
      end

      post '/create' do
        authenticate
        unless request.params.empty?
          #create record
          redirect '/home'
        else
          redirect '/input?mode=back'
        end
      end

      def call(env)
        #do something
      end

      class << self
        def redirect(location)
          raise RedirectRequest.new(location)
        end

        def authenticate
          redirect('/') unless current_user
        end
      end
    end

    run MyApp.new
