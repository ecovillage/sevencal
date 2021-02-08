# SevenCAL

Proof-of-concept rendering ical (ics) files with `simple_calendar` and Ruby on
Rails 6 using Ruby 3.

Just the very basic attributes like start and end-date and title are used. Fancy
features like schedules are ignored.

## Database creation

## Database initialization

## Configuration

Configure event sources:

```bash
# prefix with RAILS_ENV=production as needed
rails r 'EventSource.create!(name: "MyEventSource", location: "https://myseminardeskurl", kind: "seminardesk")'
rails r 'EventSource.create!(name: "MyLocalICSFile", location: "/tmp/myfile.ics", kind: "local_ics_file")'
```

Alternatively, use the `rails sevencal:add_ics_file` or `rails
sevencal:add_seminardesk_api_url` to interactively add Event Sources.

Currently, two `kind`s of EventSources are implemented:

  * `seminardesk` to fetch from a proprietary API
  * `local_ics_file` to read and parse a local ics file


## Tests

None yet.

## Data fetching and cache

Use a `rails` rake task:

```bash
rails sevencal:sync
```

that will sync all data (refresh all `EventSource`s).
This task is suitable for a cron-job.

Note that this will throw away all previously stored events and only add future
events.

Note that there is no error handling yet.

## Deployment instructions

Nothing fancy.

### Syncing scenario

For the POC the syncing scenario is as following:

A nextcloud instance downloads local caldav file and copies it to the server.
The server converts the seminardesk data and writes it to file.
The nextcloud instance downloads the remote seminardesk ics file.

## Contribution

Contributions are welcome, drop me a line / open an issue.

### License

Licensed under the [AGPLv3+](LICENSE.txt), copyright 2021 Felix Wolfsteller.

## Knowledgebase & devlog

### The Sync-Problem

* Instead of comparing everything during every sync step, a cheap solution is to
  throw everything (all events) away before importing.

### simple_calendar

* Copied the view over to add week number column.
