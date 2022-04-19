class Resume < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    def self.all_status
        [
            ["草稿","draft"],
            ["發布","published"]
        ]
    end

    
end
