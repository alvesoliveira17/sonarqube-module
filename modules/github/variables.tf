variable "project_name" {
  type = string
}

variable "project_description" {
  type = string
}

variable "project_visibility" {
  type = string
}

variable "project_secrets" {
  type = map(map(string))
}