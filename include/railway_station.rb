class RailwayStation

  attr_reader :name, :trains

  @@stations = Array.new

  include General

  def self.all
    @@stations.map{|station| station.name}
  end

  def initialize name = nil
    @name = new_number name
    @trains = Array.new
    @@stations << self
  end

  def add_train train = nil
    self.trains << train unless train.nil?
  end

  def move_train train = nil
    self.trains.delete(train) unless train.nil?
  end

  def train_list
    self.trains if self.trains.any?
  end

  def self.railway_station_list
    return @@stations
  end

  def self.railway_station_list_print
    puts @@stations.map.with_index(1){|station, index| "#{index}. Станция #{station.name}"}
  end

  def train_list_print
    self.trains.each do |train|
      puts "Поезд № #{train.number}: #{train.type}"
    end
  end

  def train_list_by_type
    count_hash_dublicate self.trains
  end

  private

  attr_writer :trains

  def count_hash_dublicate trains
    train_by_type = Hash.new
    trains.each do |train|
      train_by_type[train.type] ||= 0
      train_by_type[train.type] += 1
    end
    train_by_type.each {|key, value| puts "Поездов #{key}: #{value}" }
  end

end