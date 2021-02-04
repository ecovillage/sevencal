# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

require 'net/http'
require 'json'

namespace :sevencal do
  desc 'Import events from an ics file'
  task import_ics: :environment do
    EventSource.find_each do |event_source|
      puts "Consuming event source #{event_source.name} [#{event_source.url}]"
      now = DateTime.current
      uri = URI(event_source.url)
      response = Net::HTTP.get uri
      
      payload = JSON.parse(response, symbolize_names: true)
      dates = payload[:dates]
      
      dates.each do |date|
        event_source.events.create!(
                      start_time: Time.at(date[:beginDate]/1000),
                      end_time:   Time.at(date[:endDate]/1000),
                      title:      date[:title].first[:value]
                     )
      end
      event_source.update!(synced_at: now)
      puts "#{dates.count} events created"
    end
  end
end

