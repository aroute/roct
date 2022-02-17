# Remote OCP Container Terminal (ROCT)

This `Dockerfile` uses an Ubuntu container image to build an environment with command line tools from several cloud vendors (IBM® Cloud, Red Hat® OpenShift®, Kubectl, Helm, etc).

The primary purpose of this `Dockerfile` is to run a remote container in OpenShift via VS Code's Remote Container plugin.  

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
