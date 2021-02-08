class AddSlugToEventSources < ActiveRecord::Migration[6.1]
  def change
    add_column :event_sources, :slug, :string
    add_index :event_sources, :slug, unique: true
  end
end
