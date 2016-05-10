class Item < ActiveRecord::Base
  validates :long_url, presence: true
  validates :long_url, format: { with: URI.regexp }, if: proc { |a| a.long_url.present? }

  def pretty_short_url
    "#{App.settings.domain}#{short_url}"
  end
end
