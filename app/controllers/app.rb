class App < Sinatra::Base
  helpers Storage

  get '/' do
    slim :new
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
    "#{ settings.domain }#{ short_url }"
  end

  not_found do
    status 404
    'Sorry, this short url is not exist'
  end
end
