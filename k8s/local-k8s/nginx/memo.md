# memo
```
kubectl apply -f deployment.yml
kubectl apply -f service.yml
```

しても

```
hello-nginx   LoadBalancer   10.111.255.148   <pending>     8080:31795/TCP   113s
```
みたいになってLoadBalancerがpending状態で動かなくなる


https://github.com/hashy0917/study/tree/master/k8s/minikube/case1
の書き方だと正常に動作して、外部からもアクセスできる

