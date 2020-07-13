export PROJECT_ID="mitre-pact-$(terraform workspace show)"
gcloud auth login && gcloud auth application-default login
export SERVICES="all"
export REGION="us-east4"
