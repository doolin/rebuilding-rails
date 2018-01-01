require "rulers/array"
require "rulers/version"
require 'rulers/routing'

require 'pry'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      if env['PATH_INFO'] == '/'
        # Note that it's difficult to make Chrome NOT cache a redirect
        # on the browser side. The Chrome team acknowledges this as a
        # bug, and has resolved it as "won't fix."
        #
        # One of the suggestions is to restart the browser, which is
        # very MS Windows like: "have you restarted your computer?"
        #
        # The amount of developer time wasted tracking this down must
        # be enormous. Makes me wonder if other browsers handle redirects
        # in development mode differently.
        #
        # On the other hand, perhaps the technical difficulty presents
        # insurmountable challenges to the Chrome development team.
        #
        # return [301, { 'Content-Type' => 'text/html', 'Location' => '/quotes/a_quote' }, []]

        # public/index.html is read from the calling application,
        # in this case, best_quotes.
        return [200, { 'Content-Type' => 'text/html' }, [File.open('public/index.html').read]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue => e
        text = e.message
      end
      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
