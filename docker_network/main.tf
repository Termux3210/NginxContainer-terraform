resource "docker_network" "network"{
    name = var.network.name
    driver = "bridge"
    ipam_config{
        subnet = var.network.subnet
    }
}