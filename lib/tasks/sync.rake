# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

namespace :sevencal do
  desc 'Import events from an ics file'
  task sync: :environment do
    puts "Syncing from #{EventSource.count} Event Sources."
    EventSource.find_each do |event_source|
      if event_source.kind == 'seminardesk'
        puts "Consuming event source #{event_source.name} [#{event_source.location}]"
        event_source.events.destroy_all
        SeminardeskImporter.import event_source
        #puts "#{dates.count} events created"
        puts "events created"
      else
        puts "Consuming event source #{event_source.name} [#{event_source.location}]"
        event_source.events.destroy_all
        IcsImporter.import event_source
        #puts "#{dates.count} events created"
        puts "events created"
      end
    end
  end
end

