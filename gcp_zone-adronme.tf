resource "google_dns_managed_zone" "adronme" {
    name = "adronme"
    dns_name = "adron.me."
    description = "Production http://adron.me Domain."
}

resource "google_dns_record_set" "blog" {
    managed_zone = "${google_dns_managed_zone.adronme.name}"
    name = "blog.${google_dns_managed_zone.adronme.dns_name}"
    type = "CNAME"
    ttl = 5
    rrdatas = ["compositecode.blog."]
}

resource "google_dns_record_set" "photos" {
    managed_zone = "${google_dns_managed_zone.adronme.name}"
    name = "photos.${google_dns_managed_zone.adronme.dns_name}"
    type = "CNAME"
    ttl = 5
    rrdatas = ["domains.smugmug.com."]
}