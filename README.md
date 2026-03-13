# Repository for the Kubernetes hands-on tutorial at AmLight workshop 2026

This repo contains the source code for the Kubernetes hands-on tutorial at AmLight All Hands Meeting workshop in Mar, 2026, at FIU.

## 1 - Context and Prerequisites

The documentation here was used during a workshop at FIU/AmLight (https://amlight.net and https://ciara.fiu.edu), and we had a Kubernetes cluster that was prepared and used during this tutorial.

However, you can still run this hands-on guideline on your own machine/laptop! Please check the next paragraphs to see what you can do. If you already have access to the Kubernetes environment, you can skip the next section.

### 1.1 - Minikube

One very nice tool to help studying and testing Kubernetes is Minikube. Quoting from Minikube website:

> minikube implements a local Kubernetes cluster on macOS, Linux, and Windows. minikube's primary goals are to be the best tool for local Kubernetes application development and to support all Kubernetes features that fit.

To install Minikube on macOS, the recommended method is using Homebrew, the macOS package manager. This requires a container or virtual machine manager such as Docker. 

Prerequisites:
- A container or virtual machine manager (Docker, Hyperkit, QEMU, etc.). Docker Desktop is a common choice.
- At least 2 CPUs, 2GB of free memory, and 20GB of free disk space. 

Installation Steps:

1. Install Homebrew (if not already installed)

2. Install Minikube and Kubectl

```
brew install minikube kubectl
```

For Apple Silicon (M1/M2/M3) users: Minikube will use the docker driver with Docker Desktop installed for Apple Silicon architecture. The command is the same.

You can specify the resource limits:

```
minikube start --memory=4GB --cpus=4
```

3. Verify the Installation

```
minikube status
```

Expected output should show all components as 'Running' or 'Configured'

```
kubectl cluster-info
```

> [!NOTE]
> When using Minikube, some steps of the tutorial below will require additional plugins for Kubernetes/Minikube, namely ExternalDNS, Cert-Manager and the Let's Encrypt config for certificates creation. Here are some guidelines: install External-DNS on Minikube (https://kubernetes-sigs.github.io/external-dns/v0.13.3/tutorials/coredns/), Install nginx-ingress + cert-manager + let's encrypt (https://gist.github.com/snormore/c7c2935d746531ed0d75064a6ad6058e#install-nginx-ingress-and-cert-manager-using-helm).


## 2 - Kubernetes commands

Create the Secret and also MongoDB deployment + service:
```
kubectl apply -f mongo-secret.yaml

kubectl apply -f mongo.yaml
```

Check if the resources were created:
```
kubectl get secret
kubectl get deployment
kubectl get service -o wide
kubectl get pod -o wide 
```

Run the following sequence to have access to MongoDB:
```
$ kubectl exec -it deploy/mongo-deployment -- bash

# env

# mongosh "mongodb://$MONGO_INITDB_ROOT_USERNAME:$MONGO_INITDB_ROOT_PASSWORD@localhost:27017/?authSource=admin"

test> show dbs
admin> use local
local> show collections
local> db.startup_log.find()
```

Check the logs and troubleshoot for the MongoDB container:
```
kubectl logs deploy/mongo-deployment
kubectl describe deploy/mongo-deployment
```

Create the Kytos deployment and its services:
```
kubectl apply -f kytos.yaml
```

Check the status:
```
kubectl get deployment
```

Why Kytos is showing the status READY as "0/1" ? Use the `kubectl get pod` and then `kubectl describe` on the respective pod to try to get any clue.

Create the missing ConfigMap:
```
kubectl apply -f mongo-config.yaml
```

Now check the pods again (it may take a few seconds).

Now let's get the NodePort that was allocated to our Kytos API Service, along with the Node IP address to access the service:

```
kubectl get service/kytos-api-service -o json | grep nodePort
kubectl get node/mia-mi1-k8s03 -o wide
```

On the Node output, look for the column INTERNAL-IP and use that information combined with the Node Port to access Kytos Web UI on your browser at `http://IP:NODEPORT`

Now we will create an Ingress, so that we can access Kytos server using a friendly DNS name. Now that we will have an Ingress, we no longer need the external service (NodePort), so let's also change that. First change the DNS name to your preferred name and then create the resource:

```
sed -i.bak -e "s/MYNAME/italovalcy/g" kytos-ingress.yaml
kubectl apply -f kytos-ingress.yaml
```

Notice that the service was changed and the ingress was created.

Wait a few seconds and test again on the browser, but this time using the DNS name chosen. You can check if the DNS entry was already created by running this query (please change the MYNAME accordingly):
```
dig kytos-api-MYNAME.k8s-prod.amlight.net @ns.ampath.net +short
```

> [!TIP]
> depending on your operational system, it may create negative cache. For MacOS one tip is to clear the cache by running `sudo killall -HUP mDNSResponder`

Next step, to compliace with the best practices is to enable SSL on our Ingress. Using the Cert-Manager Kubernetes controller, along with Let's Encrypt project, we can accomplish that very easily (again please change your name):

```
sed -i.bak -e "s/MYNAME/italovalcy/g" kytos-ingress-ssl.yaml
kubectl apply -f kytos-ingress-ssl.yaml
```

Check the events relate to the ingress we just changed:

```
kubectl events ingress/kytos-api
```

After a few seconds you should see that the certificate was issued successfully:

```
$ kubectl events ingress/kytos-api
...
71s                 Normal   Issuing              Certificate/kytos-api-tls                         The certificate has been successfully issued
71s                 Normal   Complete             Order/kytos-api-tls-1-3935465576                  Order completed successfully
```

Check the certificate resource type:

```
kubectl get certificate
```

You can also see the actual certificate:

```
kubectl get secret/kytos-api-tls -o yaml
```

At this point, you may have noticed that one thing is missing: the Kytos topology. In order to have a testing topology, let's run another application and instantiate AmLight's example topology. We will use Mininet-Sec (https://mininet-sec.github.io), an enhanced version of Mininet that allows us to have a web visualization of the emulated scenario.

First we create the topology configmap:

```
kubectl apply -f mnsec-custom-topo.yaml
```

Then let's create a Deployment+Service for our application:
```
kubectl apply -f mininet-sec.yaml
```

Get the dynamic NodePort that was assigned to you (`kubectl get service/mininet-sec`) and, together with the Node IP address (`kubectl get node -o wide`), open your browser on that URL (http://NODEIP:NODEPORT)


Now that we finished our testing, we can remove everything and release the resources:

```
kubectl delete -f mininet-sec.yaml
kubectl delete -f kytos-ingress-ssl.yaml
kubectl delete -f kytos.yaml
kubectl delete -f mongo.yaml
kubectl delete -f mnsec-custom-topo.yaml
kubectl delete -f mongo-config.yaml
kubectl delete -f mongo-secret.yaml
```

## 3 - Links

This material was based on https://gitlab.com/nanuchi/k8s-in-1-hour/

* Kytos docker image: https://hub.docker.com/r/amlight/kytos
* mongodb image on Docker Hub: https://hub.docker.com/_/mongo
* k8s official documentation: https://kubernetes.io/docs/home/
