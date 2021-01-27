
kubectl apply -f mongodb.yaml
sleep 15
secs=$((15))
while [ $secs -gt 0 ]; do
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done
kubectl exec -it -c mongo mongo-0 -n logging -- mongo --host mongo-0.mongo.logging.svc.cluster.local:27017  <<EOF
  var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "mongo-0.mongo.logging.svc.cluster.local:27017",
        "priority": 2
      },
      {
        "_id": 1,
        "host": "mongo-1.mongo.logging.svc.cluster.local:27017",
        "priority": 0
      },
      {
        "_id": 2,
        "host": "mongo-2.mongo.logging.svc.cluster.local:27017",
        "priority": 0
      }
    ]
  };
  rs.initiate(cfg, { force: true });
  rs.reconfig(cfg, { force: true });
  db.getMongo().setReadPref('nearest');
EOF
kubectl apply -f prod.yaml
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done

curl -u admin:admin -H 'Content-Type: application/json' -X POST "http://$(hostname -I | awk '{print $1}'):31050/api/system/inputs" -d '{
    "title": "Standard GELF TCP input",
    "type": "org.graylog2.inputs.gelf.tcp.GELFTCPInput",
    "global": true,
    "configuration":   {
          "recv_buffer_size": 1048576,
          "tcp_keepalive": false,
          "use_null_delimiter": true,
          "number_worker_threads": 1,
          "tls_client_auth_cert_file": "",
          "bind_address": "0.0.0.0",
          "tls_cert_file": "",
          "decompress_size_limit": 8388608,
          "port": 12201,
          "tls_key_file": "",
          "tls_enable": false,
          "tls_key_password": "",
          "max_message_size": 2097152,
          "tls_client_auth": "disabled",
          "override_source": null
        },
    "node": ""
  }' -H 'X-Requested-By: cli';
