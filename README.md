## Logs as a stream

Type `make` in root directory to get list of commands.

```
$ make

configure                      Configure vm.max_map_count required by Elasticsearch
build-elk                      Setup ELK
build-emitters                 Setup logs emitters
logs                           Open Kibana in a browser
emit                           Open emitter in a browser
```

This profect consist of two docker-compose files. One for default setup of ELK accepting logs as a stream. Second is for sample logs emitters which can send logs to the ELK.

## Elasticsearch requirements

Newest versions of Elasticsearch complains about system default `vm.max_map_count` (https://www.elastic.co/guide/en/elasticsearch/reference/5.0/vm-max-map-count.html#vm-max-map-count) That's why this variable should be changed to higher one in your OS.

`echo 'vm.max_map_count=262144' >> /etc/sysctl.conf`

