class TrainCargo < Train

  def initialize number = nil
    super number, :cargo
  end

  protected

  def wagon_type_is? wagon
    wagon.class == WagonCargo
  end

end