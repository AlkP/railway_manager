class RailwayStation

  attr_reader :name, :trains

  @@stations = Hash.new

  include General

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

  def initialize name = nil
    @name = name
    @trains = Array.new
    @@stations[@name] = self
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

  private

  attr_writer :trains

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