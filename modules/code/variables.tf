variable "sonarqube" {
  type = object({
    enabled           : bool
    name              : optional(string)
    branches          : optional(list(string))
    description       : optional(string)
    visibility        : optional(string)
    import_token      : optional(bool)
    github_repository : optional(string, "")
  })
}

variable "repository" {
  type = object({
    enabled     : bool
    name        : optional(string)
    description : optional(string)
    visibility  : optional(string)
    secrets     : optional(map(map(string)), {})
  })
}