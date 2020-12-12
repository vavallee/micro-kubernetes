resource "digitalocean_droplet" "k8s1" {
  image = "ubuntu-20-04-x64"
  name = "k8s1"
  region = "tor1"
  size = "s-2vcpu-2gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.rocinante-wsl2.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y upgrade",
      "sudo swapon --show",
      "sudo fallocate -l 2G /swapfile",
      "sudo chmod 600 /swapfile",
      "sudo mkswap /swapfile",
      "sudo swapon /swapfile",
      "echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab"
    ]
  }
}
