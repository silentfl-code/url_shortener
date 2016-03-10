class App < Sinatra::Base
  register Sinatra::Logger
  helpers AppHelper

  get '/' do
    slim :new
  end

  post '/items/new' do
    short_url = get_key
    @item = Item.new(short_url: short_url,
                        long_url: params[:long_url])
    if @item.valid?
      @item.save!
      slim :success
    else
      slim :new, locals: { error_message: "invalid url" }
    end
  end

  get '/items' do
    @items = Item.all
    slim :list
  end

  before '/items/:slug' do
    logger.info({
        id: params[:slug], #ID ссылки
        #country: 
        ua: request.user_agent,
        time: Time.now,
    })
  end

  get '/items/:slug' do
    @item = Item.where(short_url: params[:slug]).first
    if @item.nil?
      not_found()
    else
      redirect @item.long_url, 301
    end
  end

  get '/items/:slug/edit' do
    @item = Item.where(short_url: params[:slug]).first
    if @item.nil?
      not_found()
    else
      slim :edit
    end
  end

  post '/items/:slug' do
    @item = Item.where(short_url: params[:slug]).first
    if @item.update_attributes(short_url: params[:short_url], long_url: params[:long_url])
      redirect '/items'
    else
      erb :edit, locals:  { error_message: "invalid url" }
    end
  end

  post '/items/:slug/destroy' do
    @item = Item.where(short_url: params[:slug]).first
    @item.destroy
    redirect '/items'
  end

  not_found do
    status 404
    'Sorry, this short url is not exist'
  end
end
