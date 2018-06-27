class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.integer :user_id
      t.string :path

      t.timestamps
    end
  end
end
