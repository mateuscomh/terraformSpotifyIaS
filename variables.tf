variable "spotify_api_key" {
  type        = string
  description = "Set this as the APIKey that the authorization proxy server outputs"
}

locals {
  songs = compact(split("\n", file("./songs.txt")))
}