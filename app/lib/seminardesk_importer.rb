# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class SeminardeskImporter
  def self.import event_source
    now = DateTime.current
    uri = URI(event_source.location)
    response = Net::HTTP.get uri
    
    payload = JSON.parse(response, symbolize_names: true)
    puts payload
    dates = payload[:dates]
    
    dates.each do |date|
      event_source.events.create!(
                    start_time: Time.at(date[:beginDate]/1000),
                    end_time:   Time.at(date[:endDate]/1000),
                    title:      date[:title].first[:value],
                    uuid:       date[:id]
                   )
    end
    event_source.update!(synced_at: now)
  end
end
