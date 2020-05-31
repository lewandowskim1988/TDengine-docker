# **Dockerized TDengine**

## **Overview**
I created this configuration for quick tests of `TDengine` with `Grafana` and `Telegraf` client.

## **How to start environment**
Please got to `grafana` directory and run
```
./grafana.sh
```
This will add `TDengine` plugin to latest `Grafana` image. I created it that way since using multistage to clone repo and add it to `Grafana` image caused weird issue with adding some random files.

Next just run
```
docker-compose up -d
```
This comand will build `TDengine` and `Ubuntu` image with `Telegraf` clinet for pushing some data.

## **Connect to Grafana**
When all containers are up and running you can go to your browser with URL `http://localhost:3000` and login with credentials `admin:admin`.
When you login you also need to add `TDengine` datasource.

## **Add example dashboard**
In `Grafana` go to `New` --> `Import` and `Upload .json file`. Choose file from `grafana/dashboard.json`

## **To do**
1. Use `Alpine` image as final image for `TDengine`
2. Add datasource automatically
