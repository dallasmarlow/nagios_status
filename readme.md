# nagios status

nagios status is a simple json http interface to nagios status using [nagios_parser](https://github.com/bernd/nagios_parser).

## examples

get /hosts/has_been_checked/0
get /hosts/host_name/dallas.marlow.com

get /services/service_description/dallas-caching-service
get /services/current_state/0

get /programs
get /info
