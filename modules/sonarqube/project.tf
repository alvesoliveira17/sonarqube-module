resource "sonarqube_project" "default" {
  for_each = { for branches in var.project_branches : branches => branches }

  name       = format("%s-%s", var.project_name, each.value)
  project    = format("%s-%s", replace(replace(var.project_name, "-", "_"), " ", "_"), each.value)
  visibility = var.project_visibility
}

resource "sonarqube_user_token" "default" {
  for_each = { for branches in var.project_branches : branches => branches }

  name        = format("%s-%s", replace(replace(var.project_name, "-", "_"), " ", "_"), each.value)
  login_name  = "admin"
  type        = "PROJECT_ANALYSIS_TOKEN"
  project_key = sonarqube_project.default[each.key].project
}