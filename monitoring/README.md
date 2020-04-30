For prometheus storage, here i used to store as emptyDir, it's recommend to store as persistence volume 
Here grafana exposed as NodePort, that way you can access your grafana with nodeIP and NodePort 31114 
- Run monitoring.sh as per below

- Example:
```
bash monitoring.sh
```

Access grafana dashboard with nodePort as 31114 like below 

```
http://10.104.67.161:31114
```

Credentails are available in grafana deployment
