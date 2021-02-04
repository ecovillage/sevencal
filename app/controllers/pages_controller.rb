# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class PagesController < ApplicationController
  def home
    @events = Event.all
  end
end

