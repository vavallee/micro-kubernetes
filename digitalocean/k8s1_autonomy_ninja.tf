resource "digitalocean_domain" "k8s1_address" {
   name = "k8s1.autonomy.ninja"
   ip_address = digitalocean_droplet.k8s1.ipv4_address
}
