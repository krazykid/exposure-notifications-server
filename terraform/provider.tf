terraform {
  backend "gcs" {
    bucket = "exposure-noti-tfstate-24b6c32c-9ec2-4465-aaf4-1117c717fa01"
    prefix = "exposure-notifications-state"
  }
}
