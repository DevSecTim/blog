---
draft: false
title: Kubernetes Operators - A Practical Dive Using Go and Kustomize
date: 2024-04-25
cover:
  image: "cover.png"
  alt: "<alt text>"
  relative: true # To us
---

## Why Build a Kubernetes Operator?

If you’ve ever wrangled with Kubernetes deployments—especially for complex or stateful apps—you’ve probably hit a wall where YAML templating just doesn’t cut it. That’s where Kubernetes Operators come in, and my [kube-operator template](https://gitlab.com/devsectim/kube-operator) offers a clean, Go-based starting point to build your own.

Let’s break down why crafting your own Operator might be worth it, how it stacks up against tools like Helm, and what kind of complexity you’re signing up for.


## What is a Kubernetes Operator?

A Kubernetes Operator is essentially a custom controller that extends Kubernetes' capabilities by managing the lifecycle of specific applications or services. It leverages Custom Resource Definitions (CRDs) to define new resource types and uses controllers to manage these resources, ensuring that the current state matches the desired state specified by the user. This allows for automating complex tasks such as scaling, backups, and upgrades.

## My Boilerplate Project

My `kube-operator` template provides a streamlined foundation for building your own Kubernetes Operator using Go. It includes:

* A skeleton project generated via Kubebuilder
* A clear `Reconcile` function for implementing custom logic
* CRD and sample manifest definitions for new resources

For example, the `Reconcile` function in `controllers/app_controller.go` includes this basic reconciliation logic:

```go
func (r *AppReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
    log := log.FromContext(ctx)

    // Fetch the App instance
    var app examplev1alpha1.App
    if err := r.Get(ctx, req.NamespacedName, &app); err != nil {
        log.Error(err, "unable to fetch App")
        return ctrl.Result{}, client.IgnoreNotFound(err)
    }

    // TODO: Add your logic here

    return ctrl.Result{}, nil
}
```

This is where you'd implement your operational logic—provisioning Deployments, Services, or managing upgrades. The template gives you the scaffolding to focus directly on your domain logic.

### The CRD Files

The CRD definitions are located in `config/crd/bases/example.devsectim.com_apps.yaml`. These define your custom resource schema:

```yaml
spec:
  group: example.devsectim.com
  names:
    kind: App
    listKind: AppList
    plural: apps
    singular: app
  scope: Namespaced
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
                replicas:
                  type: integer
                image:
                  type: string
```

This schema allows you to define something like:

```yaml
apiVersion: example.devsectim.com/v1alpha1
kind: App
metadata:
  name: my-app
spec:
  replicas: 3
  image: nginx:latest
```

This gives you the power to create custom Kubernetes resources tailored to your exact needs.

## Operators vs. Helm Charts

| Feature                  | Helm Charts                      | Kubernetes Operators                      |
| ------------------------ | -------------------------------- | ----------------------------------------- |
| **Complexity**           | Low; uses YAML templates         | High; requires programming knowledge      |
| **Flexibility**          | Limited to predefined templates  | High; can implement custom logic          |
| **Lifecycle Management** | Basic (install, upgrade, delete) | Advanced (scaling, backups, self-healing) |
| **Use Cases**            | Stateless applications           | Stateful applications, complex workflows  |
| **Learning Curve**       | Gentle                           | Steep; requires Kubernetes internals + Go |

Helm is great for deploying standard applications quickly, but Operators are a better fit when dealing with complexity and operational nuance.

### When Should You Build an Operator?

Build an Operator when:

* Your app is **stateful** (e.g., databases, queues)
* You need **custom lifecycle logic** (e.g., backups, phased upgrades)
* You want to **codify ops knowledge** into reusable, automated logic

If your app is simple and stateless, Helm or Kustomize might be all you need.

### Complexity and Maintenance

Operators bring power, but also added responsibility:

* **Development**: You need to know Go and the controller-runtime framework
* **Testing**: You’ll need unit and integration tests to cover edge cases
* **Security & Upgrades**: You’re responsible for maintaining compatibility with new Kubernetes versions

That said, the initial cost can pay dividends when managing critical, complex applications.

## Final Thoughts

Operators are a natural next step when your apps outgrow basic deployment tools. My `kube-operator` template lowers the barrier to entry, giving you a head start on your journey into Kubernetes automation.

If you're managing complex, stateful apps and tired of handling edge cases manually, give Operators a go. This template could save you hours of boilerplate and let you focus on what matters: making your app production-ready at scale.