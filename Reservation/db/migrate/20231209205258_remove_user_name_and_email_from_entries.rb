class RemoveUserNameAndEmailFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :user_name, :string
    remove_column :entries, :user_email, :string
    add_column :entries, :user_id, :integer
  end
end
