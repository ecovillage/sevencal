# SPDX-FileCopyrightText: 2021 Felix Wolfsteller
#
# SPDX-License-Identifier: AGPL-3.0-or-later

class EventSource < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :events, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
end
