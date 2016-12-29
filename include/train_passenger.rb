class TrainPassenger < Train

  def initialize
    super :passenger
  end

  protected

  def wagon_type_is? wagon
    wagon.class == WagonPassenger
  end

end