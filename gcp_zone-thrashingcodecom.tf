resource "google_dns_managed_zone" "thrashingcodecom" {
  name        = "thrashingcodecom"
  dns_name    = "thrashingcode.com."
  description = "Production http://compositecode.com Domain."
}

resource "google_dns_record_set" "ecosystem_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "r.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "NS"
  ttl          = 30

  rrdatas = [
    "ns-210.awsdns-26.com.",
    "ns-774.awsdns-32.net.",
    "ns-1828.awsdns-36.co.uk.",
    "ns-1429.awsdns-50.org.",
  ]
}

resource "google_dns_record_set" "gmail_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "MX"
  ttl          = 3600

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}

resource "google_dns_record_set" "spf_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "SPF"
  ttl          = 3600
  rrdatas      = ["v=spf1 include:_spf.google.com ~all"]
}

resource "google_dns_record_set" "txt_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "TXT"
  ttl          = 3600
  rrdatas      = ["v=spf1 include:_spf.google.com ~all"]
}

resource "google_dns_record_set" "doogle_domain_key_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "google._domainkey.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "TXT"
  ttl          = 3600
  rrdatas      = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCFJLcl28yyP+o3zjfLzCvotoNcL15xdM0+7VO/SZO6gaQ+2HPpGKLFbznHMV3XJUZujODlG8Ev1jdpkfEhhD+R39VHwHxOmnkGLl7C4Kfpsb+popsefs4/X/f1w1Rb9A8Co52a45upK2dy80DfG9Cw/93slztnNO+SbLJ/uhYEhQIDAQAB"]
}

resource "google_dns_record_set" "calendar_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "calendar.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "docs_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "docs.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "drive_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "drive.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "groups_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "groups.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "hangouts_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "hangouts.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "mail_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "mail.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "plus_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "plus.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "sheets_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "sheets.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "sites_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "sites.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "slides_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "slides.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "start_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "start.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "vault_thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "vault.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["ghs.googlehosted.com."]
}

resource "google_dns_record_set" "thrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "*.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["compositecode.blog."]
}

resource "google_dns_record_set" "blogthrashingcodecom" {
  managed_zone = "${google_dns_managed_zone.thrashingcodecom.name}"
  name         = "blog.${google_dns_managed_zone.thrashingcodecom.dns_name}"
  type         = "CNAME"
  ttl          = 3600
  rrdatas      = ["compositecode.blog."]
}
