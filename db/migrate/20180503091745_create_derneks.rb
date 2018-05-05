class CreateDerneks < ActiveRecord::Migration[5.0]
  def change
    create_table :derneks do |t|
      t.string :dernekisim
      t.string :dernekbasyil
      t.string :dernekbityil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
