class CreateYeteneks < ActiveRecord::Migration[5.0]
  def change
    create_table :yeteneks do |t|
      t.string :yetenekisim
      t.string :yetenekbdy
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
