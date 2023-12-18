terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
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
}

variable "artifactory_url" {
  type    = string
  default = null
}

variable "artifactory_access_token" {
  type    = string
  default = null
}

# Configure the Artifactory provider
provider "artifactory" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

# Configure the Xray provider
provider "xray" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

# Configure the JFrog Projects provider
provider "project" {
  url          = var.artifactory_url
  access_token = var.artifactory_access_token
}

# General repositories

resource artifactory_local_generic_repository basics_local {
  key = "generic-demo-local"
}

resource artifactory_local_generic_repository maven_dev {
  key                  = "maven-dev-local"
  project_environments = ["DEV"]
  xray_index           = true
}

resource artifactory_local_generic_repository maven_prod {
  key                  = "maven-prod-local"
  project_environments = ["PROD"]
  xray_index           = true
}

# For course 1

resource artifactory_local_docker_v2_repository docker_dev_local {
  key        = "docker-c01-dev-local"
  xray_index = true
}

resource artifactory_local_maven_repository c01_maven_dev {
  key                  = "maven-c01-dev-local"
  project_environments = ["DEV"]
  xray_index           = true
}

resource artifactory_local_maven_repository c01_maven_prod {
  key                  = "maven-c01-prod-local"
  project_environments = ["PROD"]
  xray_index           = true
}

# For course 2

resource artifactory_local_maven_repository c02_maven_dev {
  key                  = "maven-c02-dev-local"
  project_environments = ["DEV"]
  xray_index           = true
}

resource artifactory_local_maven_repository c02_maven_prod {
  key                  = "maven-c02-prod-local"
  project_environments = ["PROD"]
  xray_index           = true
}

# For course 4

resource project project {
  key          = "idedemo"
  display_name = "IDE demo"
  admin_privileges {
    index_resources  = true
    manage_members   = true
    manage_resources = true
  }
}

resource xray_security_policy policy {
  name        = "policy"
  type        = "security"
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
  name        = "project-watch"
  project_key = project.project.key
  active      = true
  assigned_policy {
    name = xray_security_policy.policy.name
    type = xray_security_policy.policy.type
  }
  watch_resource {
    type = "all-builds"
  }
}

# Others

resource artifactory_keypair main_signing {
  alias       = "main"
  pair_name   = "main"
  pair_type   = "GPG"
  private_key = file("private.asc")
  public_key  = file("public.asc")
}
