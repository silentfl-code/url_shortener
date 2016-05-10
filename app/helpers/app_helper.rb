module AppHelper
  def key
    rand(36**8).to_s(36)
  end
end
