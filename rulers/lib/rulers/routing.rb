class RouteObject
  def match
    options = {}
    options = args.pop if args[-1].is_a?(Hash)
    options[:default] ||= {}

    dest = nil
    dest = args.pop if args.size > 0
    raise "Too many args!" if args.size > 0

    parts = url.split('/')
    parts.select! { |p| !p.empty? }

    vars = []
    regexp_parts = parts.map do |part|
      if part[0] == ';'
        vars << part[1..-1]
        "([a-zA-Z0-9]]+)"
      elsif part[0] == '*'
        vars << part[1..-1]
        "(.*)"
      else
        part
      end
    end
  end

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
