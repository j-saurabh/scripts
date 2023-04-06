kubectl commands cheat sheet
------------------------------
kubectl cluster-info                                          //List the cluster details

kubectl get pods -n <namespace>                               //List pods in the particular namespace
kubectl get pods -o wide -n <namespace>                       //List pods with more information

kubectl logs <pod-name> -n <namespace>                        //Logs for a particular pod

kubectl top nodes                                             //List of nodes and information on CPU and memory consumption in decreasing order

kubectl top pods -n <namespace>                               //List the pods which are consuming high CPU and memory

kubectl describe pod <pod-name> -n <namespace>                //List various details about the pod

kubectl delete pod <pod-name> -n <namespace>                  //Delete a pod that is running

kubectl get svc -n <namespace>                                //List the services in the namespace

kubectl describe svc <service-name> -n <namespace>            //List the details about the service
