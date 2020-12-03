output "app" { value = okta_app_oauth.app }
output "client_id" { value = okta_app_oauth.app.client_id }
output "client_secret" { value = okta_app_oauth.app.client_secret }
output "cookie_secret" { value = random_string.cookie_secret.result }
output "oauth_port" { value = random_integer.port.result }
