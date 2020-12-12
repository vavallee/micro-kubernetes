resource "digitalocean_domain" "k8s2_address" {
   name = "k8s2.autonomy.ninja"
   ip_address = digitalocean_droplet.k8s2.ipv4_address
}
