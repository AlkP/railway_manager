class TrainPassenger < Train

  def initialize number = nil
    super number, :passenger
  end

  protected

  def wagon_type_is? wagon
    wagon.class == WagonPassenger
  end

end