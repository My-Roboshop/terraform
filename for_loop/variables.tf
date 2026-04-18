variable "instances" {
    default = [ "mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend" ]
    # default = {
    #     mongodb = "t2.micro"
    #     redis = "t2.micro"
    #     mysql = "t2.micro"
    # }
    # default = {
    #     mongodb = {
    #         instance_type = "t2.micro"
    #         ami = "ami-id"
    #     }
    #     redis = "t2.micro"
    #     mysql = "t2.medium"
    # }
}


variable "zone_id" {
    default = "Z0497875WFX6BJ1PL5O6"
}

variable "domain_name" {
    default = "gokul.shop" 
}