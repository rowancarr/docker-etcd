# docker-etcd

[![Build Status](https://travis-ci.org/rowancarr/docker-etcd.svg)](https://travis-ci.org/rowancarr/docker-etcd)

Simple etcd container on centos7 used for testing, you will need to run with different parameters for production. Check out the github repo for more details [coreos/etcd](https://github.com/coreos/etcd.git)

## usage

Default usage binding on any ports for general testing access you can run something like this

```
docker run --rm \
    -p 2379:2379 \
    -p 4001:4001 \
    -it rowancarr/etcd:latest
```

If you are planning on clustering then you will need to change the default options during run time, this can be done like this:

```
docker run --rm -p 2379:2379 -p 4001:4001 -it rowancarr/etcd:latest \
  -name etcd1 \
  -initial-advertise-peer-urls http://{IP_ADDRESS}:2380 \
  -listen-peer-urls http://{IP_ADDRESS}:2380 \
  -listen-client-urls http://{IP_ADDRESS}:2379,http://{IP_ADDRESS}:2379 \
  -advertise-client-urls http://{IP_ADDRESS}:2379 \
```
