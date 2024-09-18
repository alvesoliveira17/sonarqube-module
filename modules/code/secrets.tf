resource "github_actions_secret" "default" {
  for_each = local.repository_secrets

  repository       = var.repository.enabled ? var.repository.name : var.sonarqube.github_repository
  secret_name      = each.key
  plaintext_value  = each.value
}