# SevenCAL

Proof-of-concept rendering ical (ics) files with `simple_calendar` and Ruby on
Rails 6 using Ruby 3.


## Database creation

## Database initialization

## Configuration

Configure event sources:

```bash
# prefix with RAILS_ENV=production as needed
rails r 'EventSource.create!(name: "MyEventSource", url: "https://myseminardeskurl")'
```

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
