# ⛅️ Cloud Interview – Test

## Documentation

you can find the documentation in the [docs](docs/README.md) directory

## About test goals

_This is the list of the crystal clear test's goals._

1. Check skills about code organization (Structure)
2. Check skills about documentation (Code, Markdown, Wiki, etc.)
3. Check skills about SCM ([Git](https://git-scm.com/))
4. Check skills about scripting ([Python](https://pypi.org/), [Go](https://golang.org/), *sh, etc.)
5. Check skills about containerization ([Docker](https://www.docker.com/))
6. Check skills about packaging ([Helm Chart](https://helm.sh/))
7. Check skills about orchestration ([Kubernetes](https://kubernetes.io/))

### Bonus test goals

_This bonus are added to generate a discussion or to present a complete structure._

1. Check skills about a cloud provider (preference for [Google Cloud](https://cloud.google.com/) or [Amazon Web Services](https://aws.amazon.com/))
2. Check skills about structure (VPC, Firewall, Nodes, Pools, etc.)
3. Check skills about infrastructure as code ([Terraform](https://www.terraform.io/))
4. Check skills about propositions for the next (Observability, Tracing, etc.)

## Test

### Kubernetes and ingress controller

1. Install [Minikube](https://github.com/kubernetes/minikube) (script required)
2. Deploy [Traefik](https://docs.traefik.io/getting-started/install-traefik/) as Ingress Controller (script required)

### Containerize applications

1. Build the application images of `apps/hello` and `apps/world`

### Package applications

1. Create the application charts of `apps/hello` and `apps/world`

### Deploy applications

1. Deploy the application `apps/hello` and `apps/world` in your [Kubernetes](https://kubernetes.io/) cluster

### Final test

1. We must display `Hello` on <http://ornikar.dev/hello>
2. We must display `World` on <http://ornikar.dev/world>

## Test deliverables expected

1. A directory `docs/` structured with markdown file for the documentation and instructions
2. All the [Kubernetes](https://kubernetes.io/) / [Docker](https://www.docker.com/) and [Helm Chart](https://helm.sh/) files
3. All the scripts to automatize and reproduce deployment in [Minikube](https://github.com/kubernetes/minikube)
