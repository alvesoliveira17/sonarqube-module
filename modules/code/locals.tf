locals {
  repository_env_secrets = flatten([
    for env, secrets in var.repository.secrets : [
      for secret_key, secret_value in secrets : {
        environment  = env
        secret_name  = secret_key
        secret_value = secret_value
      }
    ]
  ])

  sonarqube_tokens_secrets = var.sonarqube.enabled ? flatten([
    for key, value in module.sonarqube.default.tokens : {
      environment  = key == "main" || key == "master" ? "production" : key
      secret_name  = format("SONARQUBE_TOKEN_%s", key)
      secret_value = value
    }
  ]) : []

  repository_secrets = flatten(
    concat(
      var.sonarqube.enabled ? local.sonarqube_tokens_secrets : [],
      var.repository.enabled ? local.repository_env_secrets : []
    )
  )
}
