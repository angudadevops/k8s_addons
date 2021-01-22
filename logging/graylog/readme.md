# Kubernetes Logging with Graylog 

If you want to configure Graylog with Elasticsearch as a Logging solution for kubernetes, follow the guide 

This is the minimal setup, please refer for [Graylog Architecture](https://docs.graylog.org/en/4.0/pages/architecture.html)

Run the below command to install Graylog Cluster on kubernetes 
```
kubectl apply -f graylog/*
```

Please wait 5 minutes, and then run below command to add Graylog Input
```
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
    "node": "graylog-78c75ff94-p2tz2"
  }' -H 'X-Requested-By: cli';
```

Use the below URL to access the Graylog Web interface
```
http://<host-ip>:31050
```
