class Shortener < ApplicationRecord
  after_initialize :set_short_code

  def set_short_code
    self.short_code = SecureRandom.hex[0, 6]
  end
end
