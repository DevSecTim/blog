---
draft: false
title: "Kubernetes Operators: A Practical Dive Using Go and Kustomize"
date: 2024-04-25
cover:
  image: "cover.png"
---

Kubernetes has revolutionized the way we deploy and manage containerized applications. However, as applications grow in complexity, managing their lifecycle becomes increasingly challenging. Enter **Kubernetes Operators**—a powerful pattern that extends Kubernetes' capabilities to manage complex applications seamlessly. In this article, we'll explore what Operators are, why they're beneficial, and how to build one using Go and Kustomize, drawing insights from the [kube-operator](https://gitlab.com/devsectim/kube-operator) project.

## What Is a Kubernetes Operator?

A **Kubernetes Operator** is a method of packaging, deploying, and managing a Kubernetes application. It extends the Kubernetes API to create, configure, and manage instances of complex applications on behalf of a Kubernetes user. Operators encode operational knowledge into software, automating tasks like deployment, scaling, and recovery.

## Why Use an Operator?

Operators bring several advantages to Kubernetes application management:

* **Automation**: They automate routine tasks such as backups, upgrades, and scaling.
* **Consistency**: Operators ensure that applications are deployed and managed consistently across environments.
* **Expertise Encapsulation**: They encapsulate domain-specific knowledge, reducing the need for manual intervention.

## Operators vs. Traditional Management Methods

| Aspect          | Traditional Methods               | Operators                                     |
| --------------- | --------------------------------- | --------------------------------------------- |
| **Automation**  | Manual scripts or CI/CD pipelines | Built-in automation within the cluster        |
| **Scalability** | Requires manual intervention      | Automatically scales based on defined metrics |
| **Complexity**  | Higher risk of human error        | Reduced risk through codified best practices  |
| **Maintenance** | Manual updates and rollbacks      | Automated updates with rollback capabilities  |

## Understanding Custom Resource Definitions (CRDs)

At the heart of Operators are **Custom Resource Definitions (CRDs)**. CRDs allow you to define custom resources that extend the Kubernetes API. Once a CRD is created, you can manage its instances using standard Kubernetes tools like `kubectl`.

For example, in the `kube-operator` project, a CRD named `WhaleSay` is defined to manage instances of a custom application.

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: whalesays.devsectim.io
spec:
  group: devsectim.io
  versions:
    - name: v1alpha1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              properties:
                message:
                  type: string
  scope: Namespaced
  names:
    plural: whalesays
    singular: whalesay
    kind: WhaleSay
    shortNames:
    - wsay
```

## Building an Operator with Go and Kustomize

The `kube-operator` project utilizes several Go libraries and tools:

* **Kubebuilder**: A framework for building Kubernetes APIs using custom resource definitions.
* **controller-runtime**: Provides libraries to simplify building Controllers.
* **client-go**: Official Go client for Kubernetes.
* **Kustomize**: Tool for customizing Kubernetes configurations.

These tools work together to scaffold the Operator, define APIs, and manage configurations.

## Go vs. Python for Operator Development

While Go is the de facto language for Kubernetes development, languages such as Python offer alternatives like Kopf.  Below is a comparison between native Go operators and Kopf.

| Feature         | Go                                         | Python (Kopf)                                   |
| --------------- | ------------------------------------------ | ----------------------------------------------- |
| **Performance** | High, with native concurrency support      | Moderate, limited by Python's GIL               |
| **Community**   | Large, with extensive Kubernetes support   | Growing, with active development                |
| **Ease of Use** | Steeper learning curve                     | More accessible for Python developers           |
| **Tooling**     | Rich ecosystem (Kubebuilder, Operator SDK) | Simplified with decorators and less boilerplate |

Go is preferred for performance-critical applications, while Python is suitable for simpler Operators or teams with Python expertise.

## Key Components of the `kube-operator` Project

The `kube-operator` project includes several essential files:

* **CRD YAML**: Defines the `WhaleSay` custom resource.
* **Kustomize Files**: Located in the `config` directory, these manage Kubernetes manifests.
* **Go Code**: The `controllers/whalesay_controller.go` file contains the reconciliation logic for the `WhaleSay` resource.

### Reconcile Function

Due to the declarative nature of Kubernetes, an operator's main reason to exist is to detect differences between the *actual* state of the cluster and the *desired* state, as defined in the manifests. As such the core logic loop is implemented as the `Reconcile` function in the controller.

Below is the extract from `controllers/whalesay_controller.go` to for the `Reconcile` function.  Its prime objective is to ensure a `Job` child resource is created for each `WhaleSay`, if it does not already exist:

```go
// Reconcile function responds to events for the HelloWorld CRD
func (r *WhaleSayReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
	log := log.FromContext(ctx)
	var err error

	// Get triggering instance
	inst := &arqtaniov1.WhaleSay{}
	err = r.Client.Get(ctx, req.NamespacedName, inst)
	if err != nil {
		if errors.IsNotFound(err) {
			return ctrl.Result{}, nil
		}
		// Error reading object, requeue
		return ctrl.Result{}, err
	}

	// Look for existing job
	job := &batchv1.Job{}
	findParams := types.NamespacedName{
		Name:      inst.Name + "-job",
		Namespace: inst.Namespace,
	}
	err = r.Client.Get(ctx, findParams, job)
	if err != nil {
		if errors.IsNotFound((err)) {

			// Create new child job
			job, err = r.CreateWhaleSayJob(ctx, inst)
			if err != nil {
				return ctrl.Result{}, err
			}
			log.Info("Child Job resource created on-cluster",
				"Name", inst.Name+"-job", "Namespace", inst.Namespace)

		} else {

			// Actual error
			return ctrl.Result{}, err
		}
	}

	return ctrl.Result{}, nil
}
```

## Example Usage of the WhaleSay CRD
With the operator running in the cluster, its reconcile logic is triggered any time a `WhaleSay` resource is created, updated or deleted.  Here is an example `WhaleSay` resource that can be deployed:

```yaml
apiVersion: devsectim.io/v1alpha1
kind: WhaleSay
metadata:
  name: example-whalesay
spec:
  message: "Hello from Kubernetes Operator!"
```

Once this is applied with `kubectl apply -f`, the Operator will reconcile the resource and create a pod that runs the `docker/whalesay` image to display the message.

You can view the pod and its output like so:

```bash
kubectl get pods
kubectl logs <pod-name>
```

And here is the output in the case of the example resource manifest defined above:

```
 _________________________________
< Hello from Kubernetes Operator! >
 ---------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

---

## Getting Started: Step-by-Step Guide

The full details for how to use the `kube-operator` as a starting point are in the `README.md` for the project, but broadly speaking, here are the key steps:

1. **Set Up a Local Kubernetes Cluster**:

   ```bash
   minikube start
   ```

2. **Clone the Repository**:

   ```bash
   git clone https://gitlab.com/devsectim/kube-operator.git
   cd kube-operator
   ```

3. **Install CRDs**:

   ```bash
   make install
   ```

4. **Run the Operator Locally**:

   ```bash
   make run
   ```

5. **Apply Sample Custom Resource**:

   ```bash
   kubectl apply -f config/samples/
   ```

This setup allows you to observe the Operator managing the `WhaleSay` resources within your cluster.

## Conclusion

Kubernetes Operators empower developers to manage complex applications efficiently by extending Kubernetes' capabilities. By leveraging tools like Go, Kubebuilder, and Kustomize, you can build robust Operators that automate application lifecycle management. Whether you're managing stateful applications or custom workflows, Operators offer a scalable and maintainable solution.
