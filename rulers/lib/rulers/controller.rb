require 'erubis'

module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

  def render(view_name, locals = {})
  end
end
