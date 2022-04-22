# frozen_string_literal: true

class AddColumnInResume < ActiveRecord::Migration[6.1]
  def change
    add_reference :resumes, :user, index: true
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
