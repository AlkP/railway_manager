class Route
  attr_reader :route
  def initialize route = nil
    # Нужно задать как минимум начальную и конечную станцию маршрута ['1', '2']
    return false if route.nil? || route.length < 2
    if route.class == Array
      @route = route
      return true
    else
      return false # Передан не массив с маршрутом
    end
  end
  def destroy name = ''
    # Проверяем существует ли станция на маршруте
    # и удаляем если маршрут длинее 2х станций
    return false unless @route.include?(name) && @route.length > 2
    @route.delete name
    return true
  end
  def add name = ''
    if name >= 5
      @route.insert(-2, name) # Имя новой точки маршрута не менее 5 символов
      return true
    else
      return false
    end
  end
  def list
    @route.each_with_index{|value, index| puts "#{index+1}: #{value}"}
  end
end

# route3 = Route.new(['ткач', 'срач', 'ржач'])
# route3.destroy('ржач')
# route3.add('грач')
# puts route3.list