if [[ $1 == 'create' ]] ; then
	kubectl create -f k8dashboard.yaml
	kubectl create -f k8sdashboard.yaml
	echo
	export hostIP=$(kubectl get nodes --namespace kubernetes-dashboard -o jsonpath="{.items[0].status.addresses[0].address}{'\n'}")
	export nodePort=$(kubectl get svc kubernetes-dashboard -n kubernetes-dashboard -o jsonpath="{.spec.ports[?(@.port=="443")].nodePort}{'\n'}")
	echo
	export token=$(kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') | grep -iw 'token:'| awk '{print $2}')
	nohup kubectl proxy --address='0.0.0.0' --accept-hosts='^*$' </dev/null >/dev/null 2>&1 &
	echo -e "Access Dashboard Using https://$hostIP:$nodePort"
	echo
	echo -e "Dashboard Token: 	$token"
	echo
elif [[ $1 == 'delete' ]]; then
	kubectl delete -f k8dashboard.yaml
	kubectl delete -f k8sdashboard.yaml
else
	echo -e "USAGE:

bash dashboard.sh create    :To create kubernetes dashboard
bash dashboard.sh delete    :To Delete the dashboard 
bash dashboard.sh	    :To get the Usage"
	echo
fi
