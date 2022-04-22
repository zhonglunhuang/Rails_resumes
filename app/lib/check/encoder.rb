# frozen_string_literal: true

module Check
  module Encoder
    def self.encode_password(password)
      salt = %w[a b c d e f]
      password = "z#{password.chars.zip(salt).join}y"
      password = Digest::MD5.hexdigest password
    end
  end
end
