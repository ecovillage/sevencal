# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

#cal_file = File.open("single_event.ics")

class IcsImporter
  def self.import event_source
    # Parser returns an array of calendars because a single file
    # can have multiple calendars.
    calendars = Icalendar::Calendar.parse(File.open event_source.location)

    if calendars.count != 1
      STDERR.puts "More than one calendar found in #{event_source.location}, aborting import"
      return
    end

    calendar = calendars.first

    calendar.events.each do |event|
      event_source.events.create!(
        uuid:       event.uid,
        start_time: event.dtstart,
        end_time:   event.dtend,
        title:      event.summary
      )
      puts "start date-time: #{event.dtstart}"
      puts "start date-time timezone: #{event.dtstart.ical_params['tzid']}"
      puts "summary: #{event.summary}"
    end
  end
end
