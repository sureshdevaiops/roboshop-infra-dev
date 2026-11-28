module "component" {
    for_each = var.components
    source = "../../terraform-roboshop-component"
    project = var.project
    environment = var.environment
    component = each.key
    app_version = each.value.app_version
    rule_priority = each.value.rule_priority
}