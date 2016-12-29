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

  def list_of_trains
    list_train self.trains if self.trains.any?
  end

  def list_by_type_trains
    count_hash_dublicate self.trains
  end

  private

  attr_writer :trains

  def list_train trains
    trains.each do |train|
      puts "Поезд #{train.number}: #{train.type}"
    end
  end

  def count_hash_dublicate trains
    train_by_type = Hash.new
    trains.each do |train|
      train_by_type[train.type] ||= 0
      train_by_type[train.type] += 1
    end
    train_by_type.each {|key, value| puts "Поездов #{key}: #{value}" }
  end

end