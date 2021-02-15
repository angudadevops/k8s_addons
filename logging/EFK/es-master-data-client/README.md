# Kubernetes Logging with EFK

Install the local host path provisioner for elastic search 
```
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
```

Now install the EFK stack either with prod istack

```
kubectl apply -f es-master-data-client/
```
connecting to elastic HQ should be as followed 

```
http://USERNAME:PASSWORD@DOMAIN:PORT
```
