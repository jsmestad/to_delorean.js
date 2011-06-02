class Time
  def to_delorean_format
    respond_to?(:xmlschema) ? xmlschema : strftime("%Y-%m-%dT%H:%M:%S%Z")
  end
end
