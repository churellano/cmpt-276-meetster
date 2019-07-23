class AddEventIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :event_id, :integer
  end
end
