module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action = env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize # people => People
      cont += 'Controller' # PeopleController

      [Object.const_get(cont), action]
    end
  end
end
