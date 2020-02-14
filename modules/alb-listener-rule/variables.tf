variable "name" {
  description = "The name of the target group."
  type = string
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
  type = string
  default = 80
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets."
  type = string
  default = "HTTP"
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group."
  type = string
}

variable "stickiness" {
  description = " A Stickiness block."
  type = list(object({
    type = string
    cookie_duration = number
  }))
  default = [{
    type = "lb_cookie"
    cookie_duration = 86400
  }]
}

variable "health_check" {
  description = "Listener Rule Health Check"
  type = list(object({
    interval          = number
    path              = string
    timeout           = number
    healthy_threshold = number
    port              = number
    protocol          = string
    matcher           = string
  }))
  default = [{
    interval          = 60
    path              = "/"
    timeout           = 5
    healthy_threshold = 2
    port              = 80
    protocol          = "HTTP"
    matcher           = "200"
  }]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "listener_arn" {
  description = "The ARN of the listener to which to attach the rule."
  type        = string
}

variable "host_header" {
  description = "Contains a single value item which is a list of host header patterns to match."
  type = list(object({
     host_header = list(string)
  }))
  default = []
}

variable "http_header" {
  description = "HTTP headers to match."
  type = list(object({
    http_header_name = string
    values = list(string)
  }))
  default = []
}

//variable "condition" {
//  description = "An Access Logs block"
//  type = list(object({
//    host_header = list(string)
//    http_header = list(object)
//    http_request_method = list(string)
//    path_pattern = list(string)
//    query_string = list(object)
//    source_ip = list(string)
//  }))
//  default = []
//}

variable "certificate_arn" {
  description = "The ARN of the certificate to attach to the listener."
  type = string
  default = ""
}