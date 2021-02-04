class CreateEventSources < ActiveRecord::Migration[6.1]
  def change
    create_table :event_sources do |t|
      t.string :url
      t.string :name
      t.datetime :synced_at

      t.timestamps
    end
  end
end
