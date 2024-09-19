module "sonarqubetest" {
  source = "./modules/code"

  sonarqube = {
    enabled     = true
    name        = "sonarqubetf-test"
    description = "Creating project baseline from Terraform."
    visibility  = "private"
#    github_repository  = "sonarqube-test2" # Required if repository.enabled value is false.
    branches    = [
      "main",
      "staging"
    ]
  }

  repository = {
    enabled     = true
    name        = "sonarqubetf-test"
    description = "Creating project baseline from Terraform."
    visibility  = "internal"
    secrets     = {
      production = {
        PASSWORD = "MYSUPERSECRET"
        USERNAME = "MYUSERNAME"
      }
      staging = {
        PASSWORD = "MYSUPERSECRET"
        USERNAME = "MYUSERNAME"
      }
    }
  }
}

output "sonarqube_token" {
  value     = module.sonarqubetest.sonarqube_token
  sensitive = true
}