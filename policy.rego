package terraform.analysis

import rego.v1

import input as tfplan

# Get the number of created resources
creates := [res | res:=resource_changes[_]; res.change.actions[_] == "create"]

# Limit this to 8 creations on a single run
resources_created { count(creates) > 8 }