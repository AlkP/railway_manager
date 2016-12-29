module Message
  @message = {
    list: '
      s  - Создать станцию
      t  - Создать поезд
      ta - Добавить поезд на станцию
      w  - Добавить вагон в поезд
      wd - Отцепить вагон из поезда
      l  - Список станций и поздов на станциях
      ----------------------------
      q - Выход

      ',
    add_new_station: {
      # intro: 'Если вы не введите наименование, оно сгенерируется автоматически',
      intro: 'Минимальная длина наименования станции 3 символа.',
      name_request: 'Введите новое наименование: ',
      title_list_stations: "\nСписок станций:\n"
    },
    add_new_train: {
      intro: 'Требуется задать тип нового поезда
      1. Пассажирский
      2. Грузовой',
      type_request: 'Тип позда: ',
      name_title: 'Теперь задайте номер состава. ',
      name_request: 'Если вы не введите номер, он сгенерируется автоматически: ',
      confirmation: 'Создан новый состав.'
    },
    wrong_menu: {
      intro: 'Неверный пункт меню!'
    },
    quit: {
      intro: 'Приходите еще.'
    },
    system: {
      wrong: 'Неверная команда.' ,
      get_command: 'Задайте команду: ' ,
      pause: 'Для продолжения нажмите ENTER...'

    }

  }

  def self.available
    @message[:list]
  end
  def self.system arg
    @message[:system][arg.to_sym]
  end

  def self.intro_message arg
    @message[arg.to_sym][:intro]
  end

  def self.text arg1, arg2
    @message[arg1.to_sym][arg2.to_sym]
  end

end