# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

require 'net/http'
require 'json'

namespace :sevencal do
  desc 'Import events from an ics file'
  task import_ics: :environment do
    EventSource.find_each do |event_source|
      if event_source.kind == 'seminardesk'
        puts "Consuming event source #{event_source.name} [#{event_source.location}]"
        SeminardeskImporter.import event_source
        #puts "#{dates.count} events created"
        puts "events created"
      else
        puts "Consuming event source #{event_source.name} [#{event_source.location}]"
        ICSImporter.import event_source
        #puts "#{dates.count} events created"
        puts "events created"
      end
    end
  end
end

