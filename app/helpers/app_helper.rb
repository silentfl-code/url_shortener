module AppHelper
  def get_key
    rand(36**8).to_s(36)
  end
end
