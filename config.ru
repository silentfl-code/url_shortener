require ::File.expand_path('../config/application',  __FILE__)

configure do
  # убраны гласные, чтобы short url не был словом
  # убраны похожие буквы i~l
  set :abc, "123456789bcdfghjkmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
  set :domain, "http://localhost:9292/"
end

run App
