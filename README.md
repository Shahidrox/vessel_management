## Ruby on Rails

| Languages                                                                                             | Version                |
| ----------------------------------------------------------------------------------------------------- | ---------------------- |
| Ruby                             | ruby `'3.0.3'`         |
| Ruby_on_Rails                    | rails `'7.0.3'`        |
| PostgreSQL.svg                   | (PostgreSQL) `'14.2'`  |
| Node                             | node (-> `'v16.15.0'`) |
| Docker                           | Docker `'20.10.17'`    |

## Git submodule

1. `$ git submodule init`
2. `$ git submodule update`

## Database setup

1. rails db:create
2. rails db:migrate
3. rails db:seed

or

rails db:setup

## Unit test
1. `vessel_management/vendor/gems/vessel_core/test/models/vessel_test.rb`
2. `vessel_management/vendor/gems/vessel_core/test/models/vessel_tracking_test.rb`

## API test
1. `vessel_management/spec/requests/api/v1/vessel_trackings_spec.rb`
2. `vessel_management/spec/requests/api/v1/vessels_spec.rb`