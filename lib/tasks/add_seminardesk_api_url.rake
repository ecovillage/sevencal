# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

namespace :sevencal do
  desc 'Add an seminardesk api endpoint as event source interactively'
  task add_seminardesk_api_url: :environment do
    puts "Enter Sources ('calendars') name: "
    calendar_name = gets.strip

    puts "Enter API endpoint path: "
    calendar_location = gets.strip

    event_source = EventSource.create!(
      name:     calendar_name,
      location: calendar_location,
      kind:     'seminardesk'
    )

    puts "Created."
    puts
    puts "Doing initial sync"
    SeminardeskImporter.import event_source
    puts "Done."
  end
end



