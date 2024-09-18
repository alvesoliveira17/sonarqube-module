output "tokens" {
  value = { for key, user_token in sonarqube_user_token.default : key => user_token.token }
}