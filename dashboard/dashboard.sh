kubectl create -f k8dashboard.yaml
kubectl create -f k8sdashboard.yaml 
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
nohup kubectl proxy --address='0.0.0.0' --accept-hosts='^*$' </dev/null >/dev/null 2>&1 &
