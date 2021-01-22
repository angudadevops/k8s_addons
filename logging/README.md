#### Logging for K8's

- For logs storage, here i used to store as emptyDir, it's recommend to store as persistence volume
- Here kibana exposed as NodePort, that way you can access your kibana with nodeIP and NodePort as 31113

Here Two ways to deploy logging for Kubernetes 

1. [Kubernetes Logging with Graylog](https://github.com/angudadevops/k8s_addons/tree/master/logging/graylog)

2. Kubernetes logging with EFK/ELK

- a. Deploy Logging stack end to end with one yaml. Please run the below command to install EFK stack 

   Please make sure to have at least 2 CPU for this setup
 
   Below yaml helps you to setup fluent-bit, Kibana, Elasticsearch stack. 
   ```
   kubectl apply -f k8s-logging.yaml
   ``` 

- b. Deploy each componenet individually to understand how each component has been setup.

  Please make sure to have at least 4 CPU for this Setup

  Example:
  ```
  kubectl apply -f prod-logging.yaml
  ```

  To delte the logging components 
  ```
  kubectl delete ns logging
  ```

  Access Kibana with nodePort as 31113 like below 

  ```
  Example: 
   http://10.104.67.161:31113
  ```

  3. Please run the below command to install ELK stack

  ```
  kubectl apply -f logstash.yaml
  ```
