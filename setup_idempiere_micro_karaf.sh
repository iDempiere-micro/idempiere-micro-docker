#!/bin/sh
/opt/karaf/bin/client -r 7  "feature:install http; feature:install http-whiteboard; feature:install war; feature:install webconsole"
sleep 10
/tmp/idempiere_micro.sh
