# |WIP] idempiere-micro-docker
[Docker](https://www.docker.com/) image for [iDempiere Micro](https://idempiere-micro.github.io/web/) on [Karaf](http://karaf.apache.org/)

## Quick start

Run on your own risk! Never run a script downloaded from the Internet without understanding it!

1. Run PostgreSQL with iDempiere 5.1 database inside Docker
`wget -O - https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro-docker/master/src/run_pgsql.sh | sudo bash`

2. Run iDempiere micro inside Docker
`wget -O - https://raw.githubusercontent.com/iDempiere-micro/idempiere-micro-docker/master/src/run_idempiere_micro.sh | sudo bash`

3. Test iDempiere micro authentication
`wget "http://localhost:8181/idempiere/api/authentication?username=GardenUser&password=GardenUser"`
