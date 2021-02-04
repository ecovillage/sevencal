# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

require 'net/http'
require 'json'

namespace :sevencal do
  desc 'Import events from an ics file'
  task import_ics: :environment do

    url = 'https://siebenlinden.seminardesk.de/api/eventdates'
    
    uri = URI(url)
    
    response = Net::HTTP.get uri
    
    payload = JSON.parse(response, symbolize_names: true)
    
    dates = payload[:dates]
    
    dates.each do |date|
      Event.create!(
                    start_time: Time.at(date[:beginDate]/1000),
                    end_time:   Time.at(date[:endDate]/1000),
                    title:      date[:title].first[:value]
                   )
    end
  end
end

