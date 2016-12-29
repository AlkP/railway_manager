class TrainCargo < Train

  def initialize
    super :cargo
  end

  protected

  def wagon_type_is? wagon
    wagon.class == WagonCargo
  end

end