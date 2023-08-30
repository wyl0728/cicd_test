provider "google" {
  project = "sg-rd-ce-yilin-wang"
  region  = "asia-southeast1"
}

resource "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = "asia-southeast1-b"
  
  network    = "mynetwork"
  subnetwork = "mynetwork"

  # Node pool configuration

  node_pool {
    name               = "default-pool"
    initial_node_count = 1
    
    node_config {
      machine_type = "e2-small"
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.my_cluster.name
}

output "cluster_endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}