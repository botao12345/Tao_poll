class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :option
      t.text :who_voted

      t.timestamps null: false
    end
  end
end
