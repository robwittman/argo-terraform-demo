install:
	argo template delete -n argo $(WORKFLOW) || true
	argo template create workflows/$(WORKFLOW).yaml