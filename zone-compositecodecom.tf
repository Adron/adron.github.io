resource "google_dns_managed_zone" "compositecodecom" {
    name = "compositecodecom"
    dns_name = "compositecode.com."
    description = "Production http://compositecode.com Domain."
}

resource "google_dns_record_set" "compositecodecom" {
    managed_zone = "${google_dns_managed_zone.compositecodecom.name}"
    name = "@.${google_dns_managed_zone.compositecodecom.dns_name}"
    type = "CNAME"
    ttl = 5
    rrdatas = ["compositecode.wordpress.com."]
}

resource "google_dns_record_set" "blogcompositecodecom" {
    managed_zone = "${google_dns_managed_zone.compositecodecom.name}"
    name = "blog.${google_dns_managed_zone.compositecodecom.dns_name}"
    type = "CNAME"
    ttl = 5
    rrdatas = ["blog.adron.me."]
}
