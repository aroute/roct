# Remote OCP Container Terminal (ROCT)

This `Dockerfile` uses an Ubuntu container image to build an environment with command line tools from several cloud vendors (IBM® Cloud, Red Hat® OpenShift®, Kubectl, Helm, etc).

The primary purpose of this `is to run a remote container in OpenShift via VS Code's Remote Container extension.  

Using IBM Cloud's File Storage (Gold), you can use this solution by deploying the container.

```
oc new-project roct
```
```
oc create serviceaccount roct
```
```
oc adm policy add-scc-to-user privileged -n roct -z roct
```
```
oc create -f roct-file.yaml
```

1. From VS Code running locally, install Microsoft's Kubernetes and Remote Development extensions. 
2. Log in to your OpenShift cluster locally (oc login ...)
3. Click on VS Code's Kubernetes extension icon. Right-click roct-0 pod and select Attach VS Code ...
