module Hashable
  def generate_hash(length)
    SecureRandom.hex(length)
  end
end