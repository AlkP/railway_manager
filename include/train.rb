class Train

  attr_reader :number, :type

  @@trains = Hash.new

  include General
  include Company

  NAME_LENGTH = 3

  def initialize number = nil, type
    @speed = 0
    @wagons = Array.new
    @station = nil
    @number = new_number number.to_s, NAME_LENGTH
    @type = type
    @@trains[@number] = self if valid_number?
    vallid?
  end

  def self.find number
    return @@trains[number]
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
    self.station = station
    # if self.route.include? station
    #   self.station = station
    #   return true
    # else
    #   return false # станции нет в маршруте
    # end
  end

  def current_station
    self.station
  end

  def self.all
    return @@trains
  end

  def self.all_number
    return @@trains.map{|number,value| number}
  end

  def self.print_all
    trains = self.all
    trains.each_with_index do |(number,train), index|
      puts "#{index + 1}. Поезд № #{number}, тип: #{trains[number].type.to_s}"
    end
  end

  def train_size
    self.wagons.length.to_i
  end

  def wagon_list
    self.wagons
  end

  def print_wagon_list
    wagon_list = self.wagons.map.with_index(1) {|wagon, index| " #{index}. № #{wagon.name}"}.to_a
    puts wagon_list
  end

  def list_station_in_route
    return self.route.map{|station| station.name }
  end

  def list_station_near_train_station
    index = self.route.index(self.station)
    return self.route[index-1..index+1]
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def valid_number?
    validate_number!
  rescue StandardError
    false
  end

  protected

  attr_accessor :speed, :route, :station, :wagons

  def validate!
    raise 'Wagon list nil or not Array class' if self.wagons.nil? || self.wagons.class != Array
    raise 'Number train is short' if self.number.nil? || self.number.length !~ /^\d{#{NAME_LENGTH}}$/
    raise 'Train not save in train list' if @@train[self.number].nil?
    true
  end

  def validate_number!
    raise 'Dublicate train number' if self.number.nil? || !@@trains[self.number].nil?
    true
  end

  def speed_zero?
    self.speed.zero?
  end

  def wagon_type_is? wagon
    wagon.class == Wagon
  end

end
