class RouteObject
  def initialize
    @rules = []
  end

  def match(url, *args)
  end

  def check_url(url)
  end
end

module Rulers
  class Application
    def route(&block)
      @route_obj ||= RouteObject.new
      @route_obj.instance_eval(&block)
    end

    def get_rack_app(env)
      raise 'No routes!' unless @route_obj
      @route_obj.check_url(env['PATH_INFO'])
    end

    # def get_controller_and_action(env)
    #   _, cont, action = env['PATH_INFO'].split('/', 4)
    #   cont = cont.capitalize # people => People
    #   cont += 'Controller' # PeopleController
    #
    #   [Object.const_get(cont), action]
    # end
  end
end
