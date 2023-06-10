class TemperatureType < ActiveRecord::Type::Value

  def cast(temperature)
    degree = temperature.degree
    unit = temperature.unit
    if unit == 'F'
      super(degree = (degree - 32) / 1.8)
    else
      super(degree)
    end
  end

end