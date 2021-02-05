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

Currently, two `kind`s of EventSources are implemented:

  * `seminardesk` to fetch from a proprietary API
  * `local_ics_file` to read and parse a local ics file


## Tests

None yet.

## Data fetching and cache

Use a `rails` rake task:

```bash
rails sevencal:import_ics
```

Note that there is no error handling yet.

## Deployment instructions

Nothing fancy.

## Contribution

Contributions are welcome, drop me a line / open an issue.

### License

Licensed under the [AGPLv3+](LICENSE.txt), copyright 2021 Felix Wolfsteller.

## Knowledgebase & devlog

### simple_calendar

* Copied the view over to add week number column.
