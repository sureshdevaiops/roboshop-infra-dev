variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "zone_id" {
    default = "Z01595761DU8O4AX48D6A"
}

variable "domain_name" {
    default = "ksrdaws92s.store"
}

variable "components" {
    default = {
        frontend = {
            rule_priority = 10
            app_version = "v4"
        }
        user = {
            rule_priority = 20
            app_version = "v4"
        }
        cart = {
            rule_priority = 30
            app_version = "v4"
        }
    }
}
