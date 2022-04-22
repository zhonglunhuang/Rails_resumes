# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  has_many :resumes
  before_create :encrypt

  def self.login(user_data)
    account = user_data[:account]
    password = user_data[:password]

    if account && password
      user = User.find_by('email = ? OR username = ?', account, account)
      user if user && user.password == Check::Encoder.encode_password(password)
    end
  end

  private

  def encrypt
    self.password = Digest::MD5.hexdigest salted_string(password)
  end

  def encode(psw)
    Digest::MD5.hexdigest salted_string(psw)
  end

  def salted_string(str)
    salt = %w[a b c d e f]
    str = "z#{str.chars.zip(salt).join}y"
  end
end
