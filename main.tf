terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_library_albums" "my_album" {
  albums = [
    data.spotify_album.only_in_dreams.id,
    data.spotify_album.the_promised_land.id,
  ]
}

data "spotify_album" "only_in_dreams" {
  spotify_id = "64caLagx7pyYcgS42rCqYn"
}

data "spotify_album" "the_promised_land" {
  url = "https://open.spotify.com/album/3nRnJkUJYFfxcOGgU6LNci"
}

data "spotify_search_track" "by_artist" {
  artist = "Vintage Culture"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "playlist" {
  name        = "Django Terraform Playlist"
  description = "The playlist has be created by Terraform and managed by me. Code on my github https://github.com/mateuscomh"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}
