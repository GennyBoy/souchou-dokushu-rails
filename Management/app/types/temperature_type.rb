class TemperatureType < ActiveRecord::Type::Value

  # データベース検索のメソッドを使用するため
  def serialize(temp)
    if temp && !temp.kind_of?(Numeric)
      super(trans(temp))
    else
      super
    end
  end
  def cast(temp)
    if temp && !temp.kind_of?(Numeric)
      super(trans(temp))
    else
      super
    end
  end

  private
  def trans(temperature)
    degree = temperature.degree
    unit = temperature.unit
    if unit == 'F'
      degree = (degree - 32) / 1.8
    else
      degree = degree
    end
  end

end