resource "google_dns_managed_zone" "thrashingcodecom" {
  name = "thrashingcodecom"
  dns_name = "thrashingcode.com."
  description = "Production http://compositecode.com Domain."
}

resource "google_dns_record_set" "thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name = "ecosystem.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type = "NS"
  ttl = 30
  rrdatas = ["ns-1829.awsdns-36.co.uk.", "ns-553.awsdns-05.net.", "ns-219.awsdns-27.com.", "ns-1134.awsdns-13.org."]
}
