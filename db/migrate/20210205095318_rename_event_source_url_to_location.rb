# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class RenameEventSourceUrlToLocation < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_sources, :url, :location
  end
end
