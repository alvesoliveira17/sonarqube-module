resource "github_repository" "default" {
  name        = var.project_name
  description = var.project_description
  visibility  = var.project_visibility
}

resource "github_repository_environment" "default" {
  for_each =  var.project_secrets

  environment         = each.key
  repository          = github_repository.default.name
}