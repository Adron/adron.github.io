resource "google_dns_managed_zone" "compositecodecom" {
    name = "compositecodecom"
    dns_name = "compositecode.com."
    description = "Production http://compositecode.com Domain."
}

resource "google_dns_record_set" "compositecodecom" {
    managed_zone = "${google_dns_managed_zone.compositecodecom.name}"
    name = "${google_dns_managed_zone.compositecodecom.dns_name}"
    type = "A"
    ttl = 30
    rrdatas = ["192.30.252.154", "192.30.252.153"]
}

