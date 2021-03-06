job "hello_world" {
  
  datacenters = [
  "DC1"
]
  type = "service"

  group "app" {
    count = 2

    network {
      mode = "bridge"
      port "http" {
        to = 8000
      }
    }

    
    service {
      name = "webapp"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.webapp.rule=Host(`hello-world.crunk.dk`)"
      ]
      port = "http"

      check {
        name     = "alive"
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }


    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }

    task "server" {
      driver = "docker"

      config {
        image = "mnomitch/hello_world_server"
        ports = ["http"]
      }

      env {
        MESSAGE = "Hello from Nomad!"
      }
    }
  }
}