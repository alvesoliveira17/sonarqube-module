module "sonarqube" {
  source   = "../sonarqube"
  for_each = var.sonarqube.enabled ? { "default" = var.sonarqube } : {}

  project_name        = each.value.name
  project_description = each.value.description
  project_visibility  = each.value.visibility
  project_branches    = each.value.branches
}

module "repository" {
  source   = "../github"
  for_each = var.repository.enabled ? { "default" = var.repository } : {}

  project_name        = each.value.name
  project_description = each.value.description
  project_visibility  = each.value.visibility
  project_secrets     = var.repository.secrets
}