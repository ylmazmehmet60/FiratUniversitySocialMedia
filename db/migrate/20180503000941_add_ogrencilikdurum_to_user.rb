class AddOgrencilikdurumToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ogrencilikdurum, :string
  end
end
