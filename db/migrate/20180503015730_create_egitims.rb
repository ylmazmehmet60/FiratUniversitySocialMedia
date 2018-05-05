class CreateEgitims < ActiveRecord::Migration[5.0]
  def change
    create_table :egitims do |t|
      t.string :egitimokul
      t.string :egitimbolum
      t.string :egitimseviye
      t.string :egitimbasyil
      t.string :egitimbitisyil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
