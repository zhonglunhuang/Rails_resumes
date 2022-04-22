# frozen_string_literal: true

class Resume < ApplicationRecord
  extend FriendlyId
  friendly_id :random_slug, use: :slugged
  has_one_attached :photo do |image|
    image.variant :thumb, resize_to_limit: [50, 50]
  end

  belongs_to :user
  validates :title, presence: true
  def self.all_status
    [
      %w[草稿 draft],
      %w[發布 published]
    ]
  end

  def random_slug(n = 8)
    [*('a'..'z'), *('0'..'9')].shuffle[1, n].join
  end
end
