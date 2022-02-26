oc new-project roct
oc create serviceaccount roct
oc adm policy add-scc-to-user privileged -n roct -z roct
@"
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: roct
spec:
  selector:
    matchLabels:
      app: roct
  replicas: 1
  template:
    metadata:
      labels:
        app: roct
    spec:
      serviceAccount: roct
      containers:
      - name: roct
        securityContext:
          privileged: true
        image: quay.io/aroute/roct
        imagePullPolicy: Always
        volumeMounts:
        - mountPath: /home/demo
          name: roct-storage
  volumeClaimTemplates:
  - metadata:
      name: roct-storage
    spec:
      accessModes:
      - ReadWriteMany
      resources:
        requests:
          storage: 20Gi
      storageClassName: managed-nfs-storage
"@ > roct.yaml
oc create -f roct.yaml
