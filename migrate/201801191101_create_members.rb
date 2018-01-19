class CreateMembers < ActiveRecord::Migration
  def change
    create_table :member do |t|
      t.string :password_digest, null: false
    end
  end
end

