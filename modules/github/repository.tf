resource "github_repository" "default" {
  name        = var.project_name
  description = var.project_description
  visibility  = var.project_visibility
}