package terraform.analysis

import rego.v1

import input.resource_changes

# Get the number of created resources
creates := [res | res:=resource_changes[_]; res.change.actions[_] == "create"]

resources_created if {
    count(creates) == 0
}