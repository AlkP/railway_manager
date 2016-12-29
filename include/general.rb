module General

  protected

  def new_number name
    if name.nil?
      (rand() * (10**4)).to_i.to_s
    else
      name
    end
  end

end