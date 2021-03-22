# Kubernetes Monitoring 

For prometheus storage,
```
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
```

Here grafana exposed as NodePort, that way you can access your grafana with nodeIP and NodePort 31114 

Here Two ways to deploy kubernetes monitorting

1. Deploy Monitoring stack end to end with one yaml. Please run the below command to install monitoring stack 

Below yaml helps you to setup prometheus, grafana, alertmanager stack. 
```
kubectl apply -f monitoring-all-in-one.yaml
```

Access grafana dashboard with nodePort as 31114 like below 

```
Example:

  http://10.104.67.161:31114
```

Credentails are available in grafana deployment
