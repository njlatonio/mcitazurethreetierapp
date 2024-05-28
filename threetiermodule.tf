module "three_tier_app" {
  source              = "./modulethreetierapp/"
  resource_group_name = var.three_tier_app_resource_group_name
  location            = var.three_tier_app_location
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
}
