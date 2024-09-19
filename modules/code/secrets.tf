resource "github_actions_environment_secret" "default" {
  for_each = {
    for secret in local.repository_secrets : "${secret.environment}-${secret.secret_name}" => secret
  }

  repository       = var.repository.name
  environment      = each.value.environment
  secret_name      = each.value.secret_name
  plaintext_value  = each.value.secret_value

  depends_on = [
    module.repository
  ]
}