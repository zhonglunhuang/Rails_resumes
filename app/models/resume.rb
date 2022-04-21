class Resume < ApplicationRecord
    extend FriendlyId
    friendly_id :random_slug, use: :slugged
    has_one_attached :photo
    belongs_to :user
    validates :title, presence: true
    def self.all_status
        [
            ["草稿","draft"],
            ["發布","published"]
        ]
    end

    def random_slug(n = 8)
        [*('a'..'z'),*('0'..'9')].shuffle[1,n].join
    end
    
end
