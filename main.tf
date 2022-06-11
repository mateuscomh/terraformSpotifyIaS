data "spotify_search_track" "bob" {
  artist = "Bob Dylan"
  #This will limit the number of songs by this artist, Max is 10
  limit = 5
}

data "spotify_search_track" "led" {
  artist = "Led Zeppelin"
  limit = 5
}

data "spotify_search_track" "megadeth" {
  artist = "megadeth"
  limit = 5
  #  name  = "Out of the silent planet"
}
data "spotify_search_track" "blink" {
  artist = "blink"
  limit = 5
}
data "spotify_search_track" "pearl" {
  artist = "pearl jam"
  limit = 5
}
data "spotify_search_track" "red" {
  artist = "red hot chilli peppers"
  limit = 5
}
data "spotify_search_track" "nirvana" {
  artist = "nirvana"
  limit = 5
}
data "spotify_search_track" "metallica" {
  artist = "metallica"
  limit = 5
}
data "spotify_search_track" "motor" {
  artist = "motorhead"
  limit = 5
}
data "spotify_search_track" "by_artist" {
  artist = "Vintage Culture"
}

resource "spotify_playlist" "playlist" {
  name        = "Django Terraform Playlist"
  description = "The playlist has be created by Terraform and managed by me. Code on my github https://github.com/mateuscomh"
  public      = true

  tracks = flatten([
    data.spotify_search_track.led.tracks[*].id,
    data.spotify_search_track.megadeth.tracks[*].id,
    data.spotify_search_track.metallica.tracks[*].id,
    data.spotify_search_track.pearl.tracks[*].id,
    data.spotify_search_track.red.tracks[*].id,
    data.spotify_search_track.nirvana.tracks[*].id,
    data.spotify_search_track.motor.tracks[*].id,
    data.spotify_search_track.blink.tracks[*].id,
   data.spotify_search_track.bob.tracks[*].id,
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ])
}
