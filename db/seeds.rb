urls = [
  'https://github.com/silentfl/url_shortener',
  'https://github.com/silentfl/soap',
  'https://github.com/silentfl/angular-test',
  'https://github.com/silentfl/sinatra-example',
  'https://github.com/silentfl/baduk',
  'https://github.com/silentfl/chepParse',
  'https://github.com/silentfl/bycode',
  'https://github.com/silentfl/contests',
  'https://github.com/silentfl/wget-golang',
  'https://github.com/silentfl/liveMarkup'
]
urls.size.times do |i|
  item = Item.create(short_url: i.to_s, long_url: urls[i])
  item.save!
end
