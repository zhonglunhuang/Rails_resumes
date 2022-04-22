# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false

      t.timestamps
    end

    add_index :users, %i[email username], unique: true
  end
end
