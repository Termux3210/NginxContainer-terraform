module "container"{
    count = 10
    source = "./docker_container"
    container = {
        name = "nginx-${count.index}"
        image = "nginx:latest"
        ports = [
            {
                external = 8080+count.index
                internal = 80
            },
            {
                external = 777+count.index
                internal = 777

            }
        ]
        network = [
            {
                name = "my-network"
                ip_address = "10.20.0.1${count.index}"
            }
        ]
    }
}
module "network" {
    source = "./docker_network"
    network = {
        name = "my-network"
        subnet = "10.20.0.0/24"
    }
}