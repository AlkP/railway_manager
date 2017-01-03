module General

  NAME_LENGTH = 5

  protected

  def new_number name, length = NAME_LENGTH
    if name.nil? || name.length != length || name !~ /^\d{#{length}}$/
      name = ''
      until name.length == length do
        name = (rand() * (10**length)).to_i.to_s
      end
    end
    name
  end

end