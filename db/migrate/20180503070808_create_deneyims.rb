class CreateDeneyims < ActiveRecord::Migration[5.0]
  def change
    create_table :deneyims do |t|
      t.string :deneyimkurumisim
      t.string :deneyimbirimisim
      t.string :deneyimbolumisim
      t.string :deneyimunvan
      t.string :deneyimbasyil
      t.string :deneyimbityil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
