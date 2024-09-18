locals {
  repository_secrets = var.sonarqube.enabled && var.repository.enabled ? merge(
    var.repository.secrets,
    { for key, value in module.sonarqube.default.tokens : format("SONARQUBE_TOKEN_%s", key) => value }
  ) : (
    var.sonarqube.enabled ?
    { for key, value in module.sonarqube.default.tokens : format("SONARQUBE_TOKEN_%s", key) => value }
    : var.repository.secrets
  )
}