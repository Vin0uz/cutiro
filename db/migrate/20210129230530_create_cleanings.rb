class CreateCleanings < ActiveRecord::Migration[6.1]
  def change
    create_table :cleanings do |t|
      t.string :email
      t.timestamps
    end
  end
end
