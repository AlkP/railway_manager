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
    Train.trains_list_print
    trains = Train.trains_list
    train_index = '0'
    until (1..trains.size).to_s.include? train_index do
      train_index = feedback 'add_new_wagon', 'index_request'
    end
    train = trains[train_index.to_i - 1]
    if train.type == :cargo
      train.add_wagon_in_train WagonCargo.new
    else
      train.add_wagon_in_train WagonPassenger.new
    end
    print_is 'add_new_wagon', 'wagon_list_title', train_number: train.number, train_size: train.train_size
    puts train.wagon_list
    pause
  end

  def wrong_menu
    pause
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

