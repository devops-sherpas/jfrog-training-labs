terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "9.7.0"
    }
  }
  backend "remote" {
    # Change this to be the hostname of your Artifactory environment
    hostname = "train23lom01.jfrog.io"
    # Change this to be your terraform backend repository name
    organization = "terraform-backend"
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

# Configure the Artifactory provider
provider "artifactory" {
  url          = "${var.artifactory_url}/artifactory"
  access_token = var.artifactory_access_token
}

resource "artifactory_local_maven_repository" "maven_repositories" {
  for_each = toset([
    "team1-maven-dev-local",
    "team1-maven-prod-local",
    "team2-maven-dev-local",
    "team2-maven-prod-local",
  ])
  key = each.key
}

resource "artifactory_local_docker_v2_repository" "docker_repositories" {
  for_each = toset([
    "team1-docker-dev-local",
    "team1-docker-prod-local"
  ])
  key = each.key
}

resource "artifactory_remote_maven_repository" "maven_central" {
  key = "team1-maven-central-remote"
  url = "https://jcenter.bintray.com"
}

resource "artifactory_virtual_maven_repository" "team1_maven_virtual" {
  key          = "team1-maven-virtual"
  repositories = [
    artifactory_local_maven_repository.maven_repositories["team1-maven-dev-local"].key,
    # Ensure TF module self-sufficiency
    artifactory_remote_maven_repository.maven_central.key
  ]
}

resource "artifactory_virtual_maven_repository" "team2_maven_virtual" {
  key          = "team2-maven-virtual"
  repositories = [
    artifactory_local_maven_repository.maven_repositories["team2-maven-dev-local"].key,
    # Ensure TF module self-sufficiency
    artifactory_remote_maven_repository.maven_central.key
  ]
}

# Team 1 users / groups / permissions

resource "artifactory_user" "team1_users" {
  for_each = {
    team1dev1 = artifactory_group.team1_devs
    team1dev2 = artifactory_group.team1_devs
    team1releng = artifactory_group.team1_relengs
    team1admin = artifactory_group.team1_admins
  }
  name     = each.key
  email    = "labs-${each.key}@jfrog.io"
  password = "Labuser1!"
  groups = [each.value.name]
}

resource "artifactory_group" "team1" {
  name        = "team1"
}

resource "artifactory_group" "team1_devs" {
  name        = "team1-developers"
}

resource "artifactory_group" "team1_relengs" {
  name        = "team1-release-engineers"
}

resource "artifactory_group" "team1_admins" {
  name        = "team1-admins"
}

resource "artifactory_permission_target" "team1_dev_access" {
  name = "team1-development-access"
  repo {
    repositories = [
      artifactory_local_maven_repository.maven_repositories["team1-maven-dev-local"].key,
      artifactory_local_docker_v2_repository.docker_repositories["team1-docker-dev-local"].key
    ]
    actions {
      groups {
        name        = artifactory_group.team1_devs.name
        permissions = [
          "read", "write", "annotate", "delete"
        ]
      }
      groups {
        name        = artifactory_group.team1_relengs.name
        permissions = [
          "read", "write", "annotate", "delete"
        ]
      }
    }
  }
  build {
    repositories = ["artifactory-build-info"]
    includes_pattern = ["**"]
    actions {
      groups {
        name        = artifactory_group.team1_devs.name
        permissions = ["read", "write", "annotate"]
      }
      groups {
        name        = artifactory_group.team1_relengs.name
        permissions = ["read", "write", "annotate"]
      }
    }
  }
}

resource "artifactory_permission_target" "team1_prod_access" {
  name = "team1-prod-access"
  repo {
    repositories = [
      artifactory_local_maven_repository.maven_repositories["team1-maven-prod-local"].key,
      artifactory_local_docker_v2_repository.docker_repositories["team1-docker-prod-local"].key
    ]
    actions {
      groups {
        name        = artifactory_group.team1_relengs.name
        permissions = [
          "read", "write", "annotate"
        ]
      }
    }
  }
  release_bundle {
    repositories = [
      "release-bundles",
      "release-bundles-v2"
    ]
    includes_pattern = ["team1-*"]
    actions {
      groups {
        name        = artifactory_group.team1_relengs.name
        permissions = [
          "read", "write", "annotate", "distribute"
        ]
      }
    }
  }
}

# Team 2 users / groups

resource "artifactory_user" "team2_users" {
  for_each = {
    team2dev1 = artifactory_group.team2_devs
    team2releng = artifactory_group.team2_relengs
    team2admin = artifactory_group.team2_admins
  }
  name     = each.key
  email    = "labs-${each.key}@jfrog.io"
  password = "Labuser1!"
  groups = [each.value.name]
}

resource "artifactory_group" "team2" {
  name        = "team2"
}

resource "artifactory_group" "team2_devs" {
  name        = "team2-developers"
}

resource "artifactory_group" "team2_relengs" {
  name        = "team2-release-engineers"
}

resource "artifactory_group" "team2_admins" {
  name        = "team2-admins"
}

resource "artifactory_permission_target" "team2_dev_access" {
  name = "team2-development-access"
  repo {
    repositories = [
      artifactory_local_maven_repository.maven_repositories["team2-maven-dev-local"].key
    ]
    actions {
      groups {
        name        = artifactory_group.team2_devs.name
        permissions = [
          "read", "write", "annotate", "delete"
        ]
      }
      groups {
        name        = artifactory_group.team2_relengs.name
        permissions = [
          "read", "write", "annotate", "delete"
        ]
      }
    }
  }
  build {
    repositories = ["artifactory-build-info"]
    includes_pattern = ["**"]
    actions {
      groups {
        name        = artifactory_group.team2_devs.name
        permissions = ["read", "write", "annotate"]
      }
      groups {
        name        = artifactory_group.team2_relengs.name
        permissions = ["read", "write", "annotate"]
      }
    }
  }
}

resource "artifactory_permission_target" "team2_prod_access" {
  name = "team2-prod-access"
  repo {
    repositories = [
      artifactory_local_maven_repository.maven_repositories["team2-maven-prod-local"].key
    ]
    actions {
      groups {
        name        = artifactory_group.team2_relengs.name
        permissions = [
          "read", "write", "annotate"
        ]
      }
    }
  }
  release_bundle {
    repositories = [
      "release-bundles",
      "release-bundles-v2"
    ]
    includes_pattern = ["team2-*"]
    actions {
      groups {
        name        = artifactory_group.team2_relengs.name
        permissions = [
          "read", "write", "annotate", "distribute"
        ]
      }
    }
  }
}

# General permissions

resource "artifactory_permission_target" "any_remote" {
  name = "global-remote"
  repo {
    repositories = [
      "ANY REMOTE"
    ]
    actions {
      groups {
        name        = artifactory_group.team1.name
        permissions = ["read", "write", "annotate"]
      }
      groups {
        name        = artifactory_group.team2.name
        permissions = ["read", "write", "annotate"]
      }
    }
  }
}
