# frozen_string_literal: true

class AddPinnedToResume < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :pinned, :boolean, default: false
    # Ex:- :default =>''
  end
end
