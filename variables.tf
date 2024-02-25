variable "region" {
    default = "us-east-1"
}

variable "user_arn" {
    default ="arn:aws:iam::058264422820:user/Cloud"
}

variable key_spec {
    default = "SYMMETRIC_DEFAULT"
}

variable enabled {
    default = true
}

variable "kms_alias" {
    default = "tf-kms-alias"
    type = string
}

