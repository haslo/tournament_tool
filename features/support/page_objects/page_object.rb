class PageObject

  def initialize(world)
    @world = world
  end

  def method_missing(method, *args)
    @world.send(method, *args)
  end

end
