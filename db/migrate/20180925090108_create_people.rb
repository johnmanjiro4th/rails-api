class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :e_code
      t.string :e_name
      t.string :local_station

      t.timestamps
    end
  end
end
