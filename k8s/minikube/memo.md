# memo

## sample
```
kubectl apply -f .
```
でdeploymentもserviceもまとめてdeployできる。

minikubeを実行しているマシンで
```
minikube service sample-nginx --url
```
を実行すると
`http://192.168.49.2:31583`という結果が得られたが、
```
kubectl get service
```
を実行すると
```
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
kubernetes     ClusterIP      10.96.0.1        <none>        443/TCP          26h
sample-nginx   LoadBalancer   10.109.162.140   <pending>     8080:31583/TCP   7m54s
```
という結果になり、一生pendingしている


