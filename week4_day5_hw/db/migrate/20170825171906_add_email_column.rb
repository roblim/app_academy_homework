class AddEmailColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string, default: "blahblahblah@blah.com"
  end
end
