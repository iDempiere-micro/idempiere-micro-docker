# [Docker](https://www.docker.com/) image for [iDempiere Micro](https://idempiere-micro.github.io/web/) on [Karaf](http://karaf.apache.org/)

[![Build Status](https://travis-ci.org/iDempiere-micro/idempiere-micro-docker.svg?branch=master)](https://travis-ci.org/iDempiere-micro/idempiere-micro-docker)

## Quick start

Run on your own risk! Never run a script downloaded from the Internet without understanding it!

1. Run PostgreSQL with iDempiere 5.1 database inside Docker
`wget -O - https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro-docker/master/src/run_pgsql.sh | sudo bash`

2. Run iDempiere micro inside Docker
`wget -O - https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro-docker/master/src/run_idempiere_micro.sh | sudo bash`

Note - if you see "the input device is not a TTY" e.g. because you are [running Docker inside Vagrant](https://stackoverflow.com/a/47025876/2013924), you need to run these commands manually

    sudo docker exec -i idempiere-micro-karaf /tmp/setup_idempiere_micro_karaf.sh
    sudo docker exec -i idempiere-micro-karaf /opt/karaf/bin/client "system:shutdown -f -r"

3. Test iDempiere micro authentication
`wget "http://localhost:8181/idempiere/api/authentication?username=GardenUser&password=GardenUser"`
