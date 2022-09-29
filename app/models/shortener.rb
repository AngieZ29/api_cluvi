class Shortener < ApplicationRecord
  validates :url, format: {
    with: URI::DEFAULT_PARSER.make_regexp(/^((https)|(http)).*/), message: 'URL no cumple'
  }, presence: true

  before_validation :generate_short_code

  def generate_short_code
    self.short_code = SecureRandom.hex[0, 6] if self.short_code.nil? || self.short_code.empty?
  end
end
