# Home to Seedwing server policies and data.

## Running on OpenShift

To deploy the policy server with the policies in the current namespace:

``` 4d
oc create configmap seedwing-policies --from-file=policies
oc create configmap seedwing-data --from-file=data

oc apply -f k8s
```
