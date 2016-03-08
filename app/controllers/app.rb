# убраны гласные, чтобы short url не был словом
# убраны похожие буквы i~l
ABC = "123456789bcdfghjkmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
DOMAIN = "http://localhost:4567/"

@@short_to_long = {}
@@long_to_short = {}
@@counter = 0

def add_url(url)
  i = @@counter
  @@counter += 1
  short_url = ""
  begin
    short_url += ABC[i % ABC.size]
    i /= ABC.size
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

# для просмотра что есть в "базе"
get '/stat' do
  puts @@short_to_long
end

get '/:hash' do
  long_url = find_by(short_url: params[:hash]) #TODO нужна валидация входных данных
  if long_url.nil?
    redirect long_url, 301
  else
    not_found()
  end
end

post '/' do
  short_url = find_by(long_url: params[:q])  #TODO валидация
  short_url = add_url(params[:q]) if short_url.nil?
  "#{ DOMAIN }#{ short_url }"
end

not_found do
  status 404
  'Sorry, this short url is not exist'
end
