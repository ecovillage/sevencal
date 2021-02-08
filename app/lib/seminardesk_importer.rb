# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class SeminardeskImporter
  def self.import event_source
    now = DateTime.current

    json = SeminardeskICS::API.fetch_json event_source.location
    dates = SeminardeskICS::Converter.to_icalendar(json)
   
    dates.each do |date|
      next if Time.at(date[:beginDate]/1000) < now

      event = event_source.events.find_or_create_by(
                    uuid:       date[:id]
                   )
      event.update!(
                    start_time: Time.at(date[:beginDate]/1000),
                    end_time:   Time.at(date[:endDate]/1000),
                    title:      date[:title].first[:value],
                   )
    end

    event_source.update!(synced_at: now)
  end
end
