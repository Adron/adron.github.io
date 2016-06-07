resource "google_dns_managed_zone" "compositecodecom" {
    name = "compositecodecom"
    dns_name = "compositecode.com."
    description = "Production http://compositecode.com Domain."
}

resource "google_dns_record_set" "compositecodecom" {
    managed_zone = "${google_dns_managed_zone.adronme.name}"
    name = "@.${google_dns_managed_zone.adronme.dns_name}"
    type = "CNAME"
    ttl = 5
    rrdatas = ["blog.adron.me."]
}
