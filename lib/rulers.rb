require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        # controller = QuotesController.new(env)
        # act = 'a_quote'

        # text = File.read('public/index.html')

        # controller = Object.const_get('HomeController').new(env)
        # act = 'index'

        [302, {'Location' => 'http://www.google.com'}, []]
      else
        klass, act = get_controller_and_action(env)
        puts 'act: '
        puts act
        controller = klass.new(env)
        text = controller.send(act)

        begin
          [200, {'Content-Type' => 'text/html'},
            [text]]
        rescue
          [500, {'Content-Type' => 'text/html'},
            ["Uh ohhhhhhhhhhhhhh!"]]
        end
      end
    end
  end
  class Error < StandardError; end
  # Your code goes here...
end
