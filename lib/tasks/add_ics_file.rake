# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

namespace :sevencal do
  desc 'Add an ics file as event source interactively'
  task add_ics_file: :environment do
    puts "Enter Sources ('calendars') name: "
    calendar_name = gets.strip

    puts "Enter file path: "
    calendar_location = gets.strip

    event_source = EventSource.create!(
      name:     calendar_name,
      location: calendar_location,
      kind:     'local_ics_file'
    )

    puts "Created."
    puts
    puts "Doing initial sync"
    IcsImporter.import event_source
    puts "Done."
  end
end
