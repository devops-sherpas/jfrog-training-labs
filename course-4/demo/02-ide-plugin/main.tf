terraform {
  required_providers {
    artifactory = {
      source  = "jfrog/artifactory"
      version = "9.7.0"
    }
    xray = {
      source  = "jfrog/xray"
      version = "2.1.0"
    }
    project = {
      source  = "jfrog/project"
      version = "1.3.4"
    }
  }
  backend "remote" {
    # Change this to be the hostname of your Artifactory environment
    hostname = "train23lom01.jfrog.io"
    # Change this to be your terraform backend repository name
    organization = "terraform-demo-ide-plugin"
    workspaces {
      name = "default"
    }
  }
}

variable "artifactory_url" {
  type = string
}

variable "artifactory_access_token" {
  type = string
}

provider "artifactory" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

provider "xray" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

provider "project" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

resource project project {
  key = "idedemo"
  display_name = "IDE demo"
  admin_privileges {
    index_resources  = true
    manage_members   = true
    manage_resources = true
  }
}

resource xray_security_policy policy {
  name = "policy"
  type = "security"
  project_key = project.project.key
  rule {
    name     = "rule"
    priority = 1
    criteria {
      min_severity = "Critical"
    }
    actions {
      notify_watch_recipients = true
      block_download {
        active = false
      }
    }
  }
}

resource xray_watch project_watch {
  name = "project-watch"
  project_key = project.project.key
  active = true
  assigned_policy {
    name = xray_security_policy.policy.name
    type = xray_security_policy.policy.type
  }
  watch_resource {
    type = "all-builds"
  }
}
