variable "name" {}

variable "rg" {
  type = object({
    name     = string
    location = string
  })
}

variable "sku" {
  default  = "Standard"
  type     = string
  nullable = false
}

variable "capacity" {
  default  = 0
  type     = number
  nullable = false
}

variable "tags" {
  type     = map(string)
  default  = {}
  nullable = false
}

variable "queues" {
  type = map(object({
    lock_duration                           = optional(string)
    max_size_in_megabytes                   = optional(string)
    requires_duplicate_detection            = optional(string)
    requires_session                        = optional(string)
    default_message_ttl                     = optional(string)
    dead_lettering_on_message_expiration    = optional(string)
    duplicate_detection_history_time_window = optional(string)
    max_delivery_count                      = optional(string)
    auto_delete_on_idle                     = optional(string)
  }))
  default  = {}
  nullable = false
}

variable "topics" {
  type = map(object({
    subscriptions = optional(map(object({
      dead_lettering_on_filter_evaluation_error = optional(string)
      dead_lettering_on_message_expiration      = optional(string)
      lock_duration                             = optional(string)
      max_delivery_count                        = optional(string)
      auto_delete_on_idle                       = optional(string)
      default_message_ttl                       = optional(string)
    })))
    auto_delete_on_idle                     = optional(string)
    default_message_ttl                     = optional(string)
    duplicate_detection_history_time_window = optional(string)
    max_size_in_megabytes                   = optional(string)
    requires_duplicate_detection            = optional(string)
    support_ordering                        = optional(string)
  }))
  default  = {}
  nullable = false
}

