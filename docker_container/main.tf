resource "docker_container" "container" {
    image = var.container.image
    name = var.container.name
    dynamic "ports" {
        for_each = var.container.ports
        content {
            external = ports.value.external
            internal = ports.value.internal
        }
    }
    dynamic "networks_advanced" {
        for_each = var.container.network
        content {
            name = networks_advanced.value.name
            ipv4_address = networks_advanced.value.ip_address
        }
    }
}