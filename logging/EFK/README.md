# Kubernetes Logging with EFK

Install the local host path provisioner for elastic search 
```
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
```

Now install the EFK stack either with prod or dev stack 

Dev stack include single node elasticsearch, Prod stack include 3 node ElasticSearch cluster

For both clusters login details are `elastic:changeme`

