resource "google_dns_managed_zone" "thrashingcodecom" {
  name = "thrashingcodecom"
  dns_name = "thrashingcode.com."
  description = "Production http://compositecode.com Domain."
}

// resource "google_dns_record_set" "ecosystem_thrashingcodecom" {
//   managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
//   name = "ecosystem.${google_dns_managed_zone.thrashingcodecom.dns_name}"
//   type = "NS"
//   ttl = 30
//   rrdatas = [
//     "ns-1829.awsdns-36.co.uk.",
//     "ns-553.awsdns-05.net.",
//     "ns-219.awsdns-27.com.",
//     "ns-1134.awsdns-13.org."]
// }

resource "google_dns_record_set" "gmail_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name = "@.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type = "MX"
  ttl = 3600
  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."]
}

resource "google_dns_record_set" "spf_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name = "@.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type = "SPF"
  ttl = 3600
  rrdatas = ["v=spf1 include:_spf.google.com ~all"]
}

resource "google_dns_record_set" "txt_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name = "@.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type = "TXT"
  ttl = 3600
  rrdatas = ["v=spf1 include:_spf.google.com ~all"]
}

resource "google_dns_record_set" "calendar_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name = "calendar.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type = "CNAME"
  ttl = 3600
  rrdatas = ["ghs.googlehosted.com."]
}
