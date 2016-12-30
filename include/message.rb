module Message
  @message = {
    list: '
      s  - Создать станцию
      t  - Создать поезд
      ta - Добавить поезд на станцию
      w  - Добавить вагон в поезд
      wd - Отцепить вагон из поезда
      m  - Переместить поезд на станцию
      l  - Список станций и поздов на станциях
      ----------------------------
      q - Выход

      ',
    add_new_station: {
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
      confirmation: 'Создан новый состав. Номер нового type состава: number'
    },
    add_new_wagon: {
      intro: 'Выберите поезд для добавления вагона',
      index_request: 'Введите порядковый номер состава: ',
      wagon_list_title: 'Теперь в составе № train_number вагонов: train_size. С номерами: '
    },
    remove_wagon_from_train: {
      intro: 'Выберите поезд для удаления вагона',
      title_wagon_list: 'Текущий перечень вагонов: ',
      wagon_index: 'Введите порядковый номер удаляемого вагона: ',
      new_title_wagon_list: 'Новый перечень вагонов: '
    },
    move_train_to_station: {
      intro: 'Выберите поезд для для перемещения',
      station_list: 'Выберите станцию куда переместиться поезд',
      index_request: 'Выберите станцию: ',
      title_new_list_train: 'Теперь на станции "station_name" составы: '
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