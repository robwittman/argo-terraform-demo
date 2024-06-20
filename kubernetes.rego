#package terraform
#
#import input as tfplan
#
#denied_annotations := {
#    "external-dns.alpha.kubernetes.io/ttl",
#    "other-denied-annotation-1",
#    "other-denied-annotation-2",
#}
#
#deny[reason] {
#    resource := tfplan.resource_change[_]
#    action := resource.change.actions[count(resource.change.actions) - 1]
#    contains(["create", "update"], action)
#    resource.type = "kubernetes_namespace"
#    resource.change.after.annotations[key]
#    key in denied_annotations
#    reason := sprintf("%s in denied annotations", [key])
#}