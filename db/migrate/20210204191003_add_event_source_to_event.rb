# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class AddEventSourceToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :event_source, null: false, foreign_key: true
  end
end
