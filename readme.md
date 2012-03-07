# nagios status

nagios status is a simple json http interface to nagios status using [nagios_parser](https://github.com/bernd/nagios_parser).

## examples

```
get /hosts/has_been_checked/0
get /hosts/host_name/dallas.marlow.com

get /services/service_description/dallas-caching-service
get /services/current_state/0

get /programs
get /info
````

![](http://f.cl.ly/items/2L2a0g3b0S0n1x260s0I/Screen%20Shot%202012-03-06%20at%2011.25.08%20PM.png)