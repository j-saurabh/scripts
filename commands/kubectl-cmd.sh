kubectl commands cheat sheet
------------------------------
kubectl cluster-info                                          # List the cluster details

kubectl get pods -n <namespace>                               # List pods in the particular namespace
kubectl get pods -o wide -n <namespace>                       # List pods with more information
kubectl get pod my-pod -o yaml                                # Get the yaml for the pod
kubectl get pods --field-selector=status.phase=Running        # Get the running pods in the namespace 

kubectl logs <pod-name> -n <namespace>                        # Logs for a particular pod

kubectl top nodes                                             # List of nodes and information on CPU and memory consumption in decreasing order

kubectl top pods -n <namespace>                               # List the pods which are consuming high CPU and memory

kubectl describe pod <pod-name> -n <namespace>                # List various details about the pod

kubectl delete pod <pod-name> -n <namespace>                  # Delete a pod that is running

kubectl get svc -n <namespace>                                # List the services in the namespace

kubectl describe svc <service-name> -n <namespace>            # List the details about the service

kubectl apply -f ./my-manifest.yaml                           # Create resources based on the manifest file
kubectl apply -f ./deploy1.yaml -f ./deploy2.yaml             # Create resources from multiple files

kubectl edit deployment <deployment-name>                     # Edit the deployment that is already running 

# Create multiple YAML objects from stdin
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep
spec:
  containers:
  - name: busybox
    image: busybox:1.28
    args:
    - sleep
    - "1000000"
---
