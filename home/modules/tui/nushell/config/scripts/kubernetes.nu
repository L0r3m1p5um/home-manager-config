# Nushell commands for working with kubernetes. These are dependend on kubectl being installed

use extensions.nu

def complete-secrets [] {
    kubectl get secrets -o name | lines | each {str substring 7..}
}

# Reads a secret from kubernetes and base64 decodes the values
export def "k8s read-secret" [
    name: string@complete-secrets, # secret name
    args?: list # Additional arguments to pass through to kubectl
] {
    let secret = (if ($args == null) {
        (kubectl get secret -o json $name)
    } else {
        (kubectl get secret -o json $name $args)
    } | from json | get data)
    $secret | map-values { decode base64 }
}

export def "k8s set-ns" [ namespace ] {
    (kubectl config set-context --current --namespace $namespace)
}

def complete-resources [] {
    [
        "pods",
        "deployments",
        "daemonsets",
        "statefulsets",
        "configmaps",
        "secrets",
        "nodes",
        "jobs",
        "cronjobs",
    ]
}

# A "kubectl get" wrapper that outputs data as a record or table
export def "k8s get" [
    resource: string@complete-resources,
    args?: list # Extra arguments to pass through to kubectl
] {
    let resources = (if ($args == null) {
        (kubectl get $resource -o json)
    } else {
        (kubectl get $resource -o json ...$args)
    } | from json)
    if ($resources.kind == "List") {
        $resources.items
    } else {
        $resources
    }
}

export alias "k" = kubectl