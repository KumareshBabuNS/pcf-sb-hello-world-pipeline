# pcf-sb-hello-world-pipeline
Pivotal Cloud Foundry Spring Boot Hello World App Pipeline

## Update Pipeline

```bash
fly -t jambudvipa set-pipeline -p pcf-sb-hello-world -c pipeline.yml
```

## Watch Job

```bash
fly -t jambudvipa watch --job pcf-sb-hello-world/job-hello-world --build 3
```
