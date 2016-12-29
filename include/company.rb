module Company

  def company_name
    self.company
  end

  def company_set_name name
    self.company = name
  end

  protected

  attr_accessor :company

end