class RailwayStation

  attr_reader :name, :trains

  @@stations = Hash.new

  include General

  def initialize name = nil
    @name = name
    @trains = Array.new
    @@stations[@name] = self if valid_name?
    valid?
  end

  def self.all
    @@stations
  end

  def self.all_name
    return @@stations.map{|name,value| name}
  end

  def self.print_all
    stations = self.all
    stations.each_with_index do |(name,station), index|
      puts "#{index + 1}. Станция #{name}"
    end
  end

  def add_train train = nil
    self.trains << train unless train.nil?
  end

  def move_train train = nil
    self.trains.delete(train) unless train.nil?
  end

  def train_list
    self.trains
  end

  def train_list_print
    trains = Train.all
    self.trains.each do |number|
      puts "Поезд № #{number}: #{trains[number].type}"
    end
  end

  def train_list_by_type
    count_hash_dublicate
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def valid_name?
    validate_name!
  rescue StandardError
    false
  end

  private

  attr_writer :trains

  def validate!
    raise 'Name Railway Station is short' if self.name.nil? || self.name.length < 6
    raise 'List train not Array class' if self.trains.nil? || self.trains.class != Array
    raise 'Station not save in Railway Station list' if @@stations[self.name].nil?
    true
  end

  def validate_name!
    raise 'Dublicate name station' if self.name.nil? || !@@stations[self.name].nil?
    true
  end

  def count_hash_dublicate
    train_by_type = Hash.new
    trains = Train.all
    self.trains.each do |number|
      train_by_type[trains[number].type] ||= 0
      train_by_type[trains[number].type] += 1
    end
    train_by_type.each {|key, value| puts "Поездов #{key}: #{value}" }
  end

end