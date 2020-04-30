kubectl create ns monitoring 
kubectl apply -f clusterRole.yml -n monitoring 
kubectl apply -f prometheus-config.yml -n monitoring
kubectl apply -f prometheus-deploy.yml -n monitoring
kubectl apply -f prometheus-svc.yml -n monitoring
kubectl apply -f grafana.yml -n monitoring
kubectl apply -f grafana-svc.yaml -n monitoring
kubectl apply -f node-exporter.yml -n monitoring
kubectl apply -f state-metrics.yml -n monitoring
kubectl apply -f state-metrics-rbac.yml -n monitoring

