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
      available_message
      commamd = feedback 'get_command'
      case commamd
      when 's'
        option 'add_new_station'
      when 't'
        option 'add_new_train'
      when 'q'
        option 'quit'
      else
        option 'wrong_menu'
      end
    end
  end

  private

  def available_message
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

    print_is 'add_new_train', 'confirmation', " Номер нового #{train.type} состава: #{train.number}"
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
      print Message.system arg1
    else
      print Message.text arg1, arg2
    end
    puts arg3.nil? ? '' : arg3
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

