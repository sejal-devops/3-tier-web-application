variable "vpc_cidr" {
    type = string
    default = "20.0.0.0/16"
  
}
variable "az" {
  type = list(string)
  default = ["ap-south-1a","ap-south-1b"]
}
variable "cidr_block" {

    type = list(string)
    default = ["20.0.2.0/24","20.0.3.0/24"]
  
}