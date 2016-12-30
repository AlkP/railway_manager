require "./include/general.rb"
require "./include/message.rb"
require "./include/company.rb"
require "./include/instance_counter.rb"
require "./include/railway_station.rb"
require "./include/route.rb"
require "./include/train.rb"
require "./include/train_cargo.rb"
require "./include/train_passenger.rb"
require "./include/wagon.rb"
require "./include/wagon_cargo.rb"
require "./include/wagon_passenger.rb"



class Main

  def initialize; end

  def run
    loop do
      available_commands
      commamd = feedback 'get_command'
      case commamd
      when 's'
        option 'add_new_station'
      when 't'
        option 'add_new_train'
      when 'w'
        option 'add_new_wagon'
      when 'wd'
        option 'remove_wagon_from_train'
      when 'm'
        option 'move_train_to_station'
      when 'q'
        option 'quit'
      else
        option 'wrong_menu'
      end
    end
  end

  private

  def available_commands
    system 'clear'
    puts Message.available
  end

  def option command
    system 'clear'
    puts Message.intro_message command
    send command
  end

  def add_new_station
    station = ''
    until station.length >= 3 do
      station = feedback 'add_new_station', 'name_request'
    end
    RailwayStation.new station
    print_is 'add_new_station', 'title_list_stations'
    puts RailwayStation.all.to_s
    pause
  end

  def add_new_train
    type = '0'
    until ['1', '2'].include? type do
      type = feedback 'add_new_train', 'type_request'
    end

    print_is 'add_new_train', 'name_title'
    new_number = feedback 'add_new_train', 'name_request'

    if type == '1'
      train = TrainPassenger.new new_number
    else
      train = TrainCargo.new new_number
    end

    print_is 'add_new_train', 'confirmation', type: train.type, number: train.number
    pause
  end

  def add_new_wagon

    train = list_train_and_get_train

    if train.type == :cargo
      train.add_wagon_in_train WagonCargo.new
    else
      train.add_wagon_in_train WagonPassenger.new
    end
    print_is 'add_new_wagon', 'wagon_list_title', train_number: train.number, train_size: train.train_size
    train.print_wagon_list
    pause
  end

  def remove_wagon_from_train

    train = list_train_and_get_train

    print_is 'remove_wagon_from_train', 'title_wagon_list'
    train.print_wagon_list
    wagon_index = feedback 'remove_wagon_from_train', 'wagon_index'
    train.remove_wagon_from_train train.wagon_list[wagon_index.to_i - 1]
    print_is 'remove_wagon_from_train', 'new_title_wagon_list'
    train.print_wagon_list
    pause

  end

  def move_train_to_station

    train = list_train_and_get_train
    print_is 'move_train_to_station', 'station_list'
    station = list_station_and_get_station

    unless train.current_station.nil?
      move_train_from_station train
    end
    train.move_to station.name
    station.add_train train
    print_is 'move_train_to_station', 'title_new_list_train', station_name: station.name
    station.train_list_print
    pause
  end

  def move_train_from_station train
    railway_stations = RailwayStation.railway_station_list
    railway_stations.each do |railway_station|
      railway_station.move_train train if railway_station.name == train.current_station
    end
  end

  def wrong_menu
    pause
  end

  def list_train_and_get_train
    Train.trains_list_print
    trains = Train.trains_list
    train_index = '0'
    until (1..trains.size).to_s.include? train_index do
      train_index = feedback 'add_new_wagon', 'index_request'
    end
    return trains[train_index.to_i - 1]
  end

  def list_station_and_get_station
    RailwayStation.railway_station_list_print
    railway_stations = RailwayStation.railway_station_list
    railway_station_index = '0'
    until (1..railway_stations.size).to_s.include? railway_station_index do
      railway_station_index = feedback 'move_train_to_station', 'index_request'
    end
    return railway_stations[railway_station_index.to_i - 1]
  end

  def pause
    puts Message.system(:pause)
    gets
  end

  def quit
    exit
  end

  def print_is arg1, arg2 = nil, arg3 = nil
    if arg2.nil?
      puts Message.system arg1
    else
      text = Message.text arg1, arg2
      unless arg3.nil?
        arg3.each_key do |key|
          text = text.gsub(key.to_s, arg3[key].to_s)
        end
      end
      puts text
    end
  end

  def feedback arg1, arg2 = nil
    if arg2.nil?
      print Message.system arg1
    else
      print Message.text arg1, arg2
    end
    val = gets.chomp.to_s
    val = nil if val.length == 0
    return val
  end

end

main = Main.new
main.run

