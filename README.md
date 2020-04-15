# go-tekton

Build a go project with tekton

# build
* edit the docker credentials to match yours
* edit the docker-registry.yaml to match your own directory
* edit the git.yaml to map your source code area
* kubectl apply the tekton files :
  * docker-credentials-template.yaml  
  * docker-registry.yaml  
  * github.yaml  
  * serviceaccount.yaml  
  * task.yaml
* Trigger the task execution with this file : kubectl apply 
  * taskrun.yaml  
  
# check the behavior with the tkn tool or the tekton gui web interface
  * tkn tr list
  * tkn tr logs 
  
# check that the newly created image is on the docker hub at the place you specified.
