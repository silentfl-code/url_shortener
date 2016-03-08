module Storage
  @@short_to_long = {}
  @@long_to_short = {}
  @@counter = 0

  def add_url(url)
    i = @@counter
    @@counter += 1
    short_url = ""
    begin
      short_url += settings.abc[i % settings.abc.size]
      i /= settings.abc.size
    end while i != 0
    @@short_to_long[short_url] = url
    @@long_to_short[url] = short_url
    short_url
  end

  # i.e. find_by(short_url: "abc")
  def find_by(params)
    return @@short_to_long[params[:short_url]] if params[:short_url]
    return @@long_to_short[params[:long_url]]  if params[:long_url]
    return nil
  end
end
