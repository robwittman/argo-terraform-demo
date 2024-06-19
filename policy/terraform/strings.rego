package terraform

import input as tfplan

required_string_length := 24

deny[reason] {
	resource := tfplan.resource_changes[_]
	action := resource.change.actions[count(resource.change.actions) - 1]
	contains(["create", "update"], action)
	resource.type = "random_string"
	not resource.change.after.length >= required_string_length
	reason := sprintf("random string must be at least %d characters long", [required_string_length])
}
