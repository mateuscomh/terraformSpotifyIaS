output "playlist_url" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.playlist.id}"
  description = "The playlist has be created by Terraform and managed by me. Code on my github https://github.com/mateuscomh"
}