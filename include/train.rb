class Train

  @@trains = Array.new

  include General
  include Company

  attr_reader :number, :type

  def self.find number
    @@trains.each{|train| return train if train.number == number}
    return nil
  end

  def initialize number = nil, type
    @speed = 0
    @wagons = Array.new
    @station = ""
    @number = new_number number
    @type = type
    @@trains << self
  end

  def speed_up
    self.speed += 10
  end

  def speed_down
    self.speed -= 10 if current_speed >= 10
  end

  def current_speed
    self.speed
  end

  def add_wagon_in_train wagon
    self.wagons << wagon if speed_zero? && (wagon_type_is? wagon)
  end

  def remove_wagon_from_train wagon
    self.wagons.delete(wagon) if speed_zero?
  end

  def assign_the_route route
    self.route = route
    self.station = route.first
    return true
  end

  def move_to station
    if self.route.include? station
      self.station = station
      return true
    else
      return false # станции нет в маршруте
    end
  end

  def self.trains_list
    return @@trains
  end

  def self.trains_list_print
    puts @@trains.map.with_index(1){|train, index| "#{index}. Поезд № #{train.number}, тип: #{train.type.to_s}"}
  end

  def train_size
    self.wagons.length.to_i
  end

  def wagon_list
    self.wagons.map.with_index(1) {|wagon, index| " #{index}. № #{wagon.name}"}.to_a
  end

  def list_station_in_route
    return self.route.map{|station| station.name }
  end

  def list_station_near_train_station
    index = self.route.index(self.station)
    return self.route[index-1..index+1]
  end

  protected

  attr_accessor :speed, :route, :station, :wagons

  def speed_zero?
    self.speed.zero?
  end

  def wagon_type_is? wagon
    wagon.class == Wagon
  end

end
