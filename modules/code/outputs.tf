output "sonarqube_token" {
  value     = var.sonarqube.enabled ? try(module.sonarqube.default.tokens, null) : null
  sensitive = true
}