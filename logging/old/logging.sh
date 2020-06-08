kubectl $1 ns logging
kubectl $1 -f es-discovery-svc.yaml -n logging
kubectl $1 -f es-svc.yaml -n logging
kubectl $1 -f es-master.yaml -n logging
kubectl rollout status -f es-master.yaml -n logging
kubectl $1 -f es-ingest-svc.yaml -n logging
kubectl $1 -f es-ingest.yaml -n logging
kubectl rollout status -f es-ingest.yaml -n logging
kubectl $1 -f es-data.yaml -n logging
kubectl rollout status -f es-data.yaml -n logging
kubectl $1 -f es-curator-config.yaml -n logging
kubectl $1 -f es-curator.yaml -n logging
kubectl $1 -f fluent-bit-service-account.yaml -n logging
kubectl $1 -f fluent-bit-role.yaml -n logging
kubectl $1 -f fluent-bit-role-binding.yaml -n logging
kubectl $1 -f fluent-bit-configmap.yaml -n logging
kubectl $1 -f fluentd-bit.yml -n logging
kubectl $1 -f kibana.yml  -n logging
kubectl $1 -f kibanasvc.yml  -n logging
