class Wagon

  include General
  include Company
  include InstanceCounter

  attr_reader :name, :type

  def initialize name = nil, type
    @name = new_number name
    @type = type
    register_instance
  end

end
