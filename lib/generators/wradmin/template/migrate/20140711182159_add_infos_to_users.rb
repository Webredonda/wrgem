class AddInfosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :avatar, :string
    add_column :users, :about, :text
    add_column :users, :birthday, :date
    add_column :users, :ocupation, :string
    add_column :users, :phone, :string
    add_column :users, :autorization, :boolean
  end
end
