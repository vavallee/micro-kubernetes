resource "digitalocean_domain" "k8s-lb_address" {
   name = "k8s.autonomy.ninja"
   ip_address = digitalocean_loadbalancer.k8s-lb.ip
}
