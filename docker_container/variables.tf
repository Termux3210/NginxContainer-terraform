variable "container" {
    type = object({
        name = string
        image = string
        ports = list(
            object({
                external = number
                internal = number
            })
        )
        network = list(
            object({
                name = string
                ip_address = string
            }
            )
        )
    })
}