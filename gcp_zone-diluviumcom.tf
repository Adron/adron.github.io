resource "google_dns_managed_zone" "datadiluviumcom" {
  name        = "datadiluviumcom"
  dns_name    = "datadiluvium.com."
  description = "Production http://datadiluvium.com Domain."
}

resource "google_dns_record_set" "datadiluviumcom" {
  managed_zone = "${google_dns_managed_zone.datadiluviumcom.name}"
  name         = "${google_dns_managed_zone.datadiluviumcom.dns_name}"
  type         = "A"
  ttl          = 30

  rrdatas = [
    "192.30.252.154",
    "192.30.252.153",
  ]
}

resource "google_dns_record_set" "blogdatadiluviumcom" {
  managed_zone = "${google_dns_managed_zone.datadiluviumcom.name}"
  name         = "blog.${google_dns_managed_zone.datadiluviumcom.dns_name}"
  type         = "CNAME"
  ttl          = 30
  rrdatas      = ["compositecode.blog."]
}
