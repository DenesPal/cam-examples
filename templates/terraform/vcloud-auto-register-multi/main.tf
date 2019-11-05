resource "vcd_vapp" "vapp" {
  name = "${var.service}"
}

resource "vcd_vapp_vm" "linux" {
  count         = 2
  vapp_name     = "${vcd_vapp.vapp.name}"
  name          = "${var.service}-L${count.index}"
  catalog_name  = "${var.catalog_name}"
  template_name = "${var.linux_template}"
  memory        = "${var.memory}"
  cpus          = 1
  cpu_cores     = 1
  network {
    type               = "org"
    name               = "${var.network_name}"
    ip_allocation_mode = "POOL"
    is_primary         = true
  }
  depends_on = ["vcd_vapp.vapp"]
  initscript = <<EOF
#!/bin/bash
if [ "$1" = "precustomization" ]; then
    exit
fi
echo root:ElasticBox123 | chpasswd
EOF
}

resource "vcd_vapp_vm" "windows" {
  count         = 1
  vapp_name     = "${vcd_vapp.vapp.name}"
  name          = "${var.service}-W${count.index}"
  catalog_name  = "${var.catalog_name}"
  template_name = "${var.windows_template}"
  memory        = 2048
  cpus          = 2
  cpu_cores     = 1
  network {
    type               = "org"
    name               = "${var.network_name}"
    ip_allocation_mode = "POOL"
    is_primary         = true
  }
  depends_on = ["vcd_vapp.vapp"]
  initscript = "net user administrator ElasticBox123"
}
