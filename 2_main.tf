provider "google" {
  credentials = file("path/to/gcp/credentials.json")
  project     = "supra-0224"
  region      = "us-central1"
}

provider "aws" {
  access_key = "your-aws-access-key"
  secret_key = "your-aws-secret-key"
  region     = "us-west-2"
}

resource "random_shuffle" "gcp_regions" {
  input = ["us-central1", "us-east1", "us-west1", "europe-west1", "asia-east1"]
  result_count = 5
}

resource "random_shuffle" "aws_regions" {
  input = ["us-west-2", "us-east-1", "eu-west-1", "eu-central-1", "ap-southeast-1"]
  result_count = 5
}

resource "google_compute_instance" "gcp_nodes" {
  count        = 5
  name         = "gcp-node-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "${random_shuffle.gcp_regions.result[count.index]}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "aws_instance" "aws_nodes" {
  count         = 5
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0123456789abcdef0"

  tags = {
    Name = "aws-node-${count.index}"
  }
}

output "gcp_nodes_report" {
  value = [for instance in google_compute_instance.gcp_nodes : {
    id       = instance.id
    name     = instance.name
    provider = "GCP"
    region   = split("-", instance.zone)[0]
    zone     = split("-", instance.zone)[1]
  }]
}

output "aws_nodes_report" {
  value = [for instance in aws_instance.aws_nodes : {
    id       = instance.id
    name     = instance.tags.Name
    provider = "AWS"
    region   = split("-", instance.subnet_id)[1]
    zone     = split("-", instance.subnet_id)[2]
  }]
}