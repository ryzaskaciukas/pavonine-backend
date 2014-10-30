class CreateCurrentUsers < ActiveRecord::Migration
  def change
    create_table :current_users do |t|
      t.string :access_token

      t.timestamps
    end
  end
end
