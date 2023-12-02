# cloud-cli
Container Docker CLI AWS|GCP|AZURE|DO


# Usage
```bash
docker run -it --rm -v ~/.aws:/root/.aws -v ~/.gcp:/root/.gcp -v ~/.azure:/root/.azure -v ~/.config/doctl:/root/.config/doctl -v ~/.ssh:/root/.ssh -v $(pwd):/app -w /app --name cloud-cli cloud-cli:latest bash
# docker run -it --rm jniltinho/cloud-cli:latest bash
```

# Build
```bash
docker build -t cloud-cli:latest .
# docker build --no-cache -t cloud-cli:latest .
# bash build.sh
```
