resource "digitalocean_loadbalancer" "k8s-lb" {
  name = "k8s-lb"
  region = "tor1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.k8s1.id, digitalocean_droplet.k8s2.id ]
}
