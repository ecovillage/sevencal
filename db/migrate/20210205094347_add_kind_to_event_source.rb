class AddKindToEventSource < ActiveRecord::Migration[6.1]
  def change
    add_column :event_sources, :kind, :string
  end
end
