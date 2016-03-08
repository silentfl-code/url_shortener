class Item < ActiveRecord::Base 
  validates :long_url, presence: true
  validates :long_url, format: { with: URI.regexp }, if: Proc.new { |a| a.long_url.present? } #TODO фильтровать /^data|^javascript/i
end
