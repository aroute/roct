# Remote OCP Container Terminal (ROCT)

This solution uses an Ubuntu container image to build a remote environment with command line tools from several cloud vendors: IBM® Cloud, Red Hat® OpenShift®, Kubectl, Helm, etc.

The primary goal of this is to use Microsoft Visual Studio Code's Remote Container extension to run a remote container in an OpenShift cluster.  

The solution uses IBM File or Block (for ROKS clusters) and managed-nfs-storage (Technology Zone).

## Manual deploy

⤵️ See below section if you wish to automatically deploy via a bash or powershell script.

```
oc login ...
```
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

1. From VS Code running locally, install Microsoft's [Kubernetes](https://code.visualstudio.com/docs/azure/kubernetes#_install-the-kubernetes-extension) and [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extensions. 
2. Click on VS Code's Kubernetes extension icon. Drop-down the cluster with roct. Drop-down Workloads - Pods. Right-click `roct-0` pod and select Attach VS Code.
3. This opens up a new VS Code window. The extension will install some binaries on the remote container. Wait for the installation to finish and then open a folder to `/home/demo/` directory. Open a Terminal and type bash to switch to bash prompt.

## Automated Install

### MacOS/Linux
```shell
oc login ...
```
```shell
chmod +x roct_file.sh
```
```shell
./roct_file.sh
```
### Windows
```powershell
oc login ...
```
```powershell
.\win_roct_file.ps1
```
1. From VS Code running locally, install Microsoft's [Kubernetes](https://code.visualstudio.com/docs/azure/kubernetes#_install-the-kubernetes-extension) and [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extensions. 
2. Click on VS Code's Kubernetes extension icon. Drop-down the cluster with roct. Drop-down Workloads - Pods. Right-click `roct-0` pod and select Attach VS Code.
3. This opens up a new VS Code window. The extension will install some binaries on the remote container. Wait for the installation to finish and then open a folder to `/home/demo/` directory. Open a Terminal and type bash to switch to bash prompt.

#### Troubleshooting

On Windows, in the Powershell. If you receive an error about the code not being digitally signed. Run the following command:
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
