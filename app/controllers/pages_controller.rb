# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class PagesController < ApplicationController
  def home
    date = DateTime.parse params[:start_date]
    if date < DateTime.current.beginning_of_month
      params[:start_date] = Date.current.to_s
    end

    @events = Event.all
    @event_sources = EventSource.all
  end

  def week
    @events = Event.all
    @event_sources = EventSource.all
  end
end

