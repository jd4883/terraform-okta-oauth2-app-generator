resource "okta_app_oauth" "app" {
  label             = var.label
  type              = var.type
  grant_types       = var.grant_types
  login_uri         = formatlist("%s/oauth2/default", var.urls).0
  redirect_uris     = formatlist("%s/oauth2/callback", var.urls)
  status            = var.status
  auto_key_rotation = var.key_rotation
  #logo_uri                   = var.logo_uri # disabled as a recent update seems to disallow this to be set to an empty string
  hide_ios                   = true
  hide_web                   = true
  response_types             = var.response_types
  token_endpoint_auth_method = var.auth_method
}

resource "okta_app_user" "user" {
  app_id   = okta_app_oauth.app.id
  user_id  = data.okta_user.user.id
  username = data.okta_user.user.email
}

resource "random_string" "cookie_secret" {
  length  = 32
  special = true
}

resource "random_integer" "port" {
  max = 50000
  min = 20000
}
