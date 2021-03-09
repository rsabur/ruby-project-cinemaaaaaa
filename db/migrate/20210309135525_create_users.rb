class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    appcreate_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
    end
  end
end
