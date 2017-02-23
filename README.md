# pcf-sb-hello-world-pipeline

Pivotal Cloud Foundry Spring Boot Hello World Pipeline

## Setup Credentials/Configuration File

```bash
cp credentials-template.yml credentials.yml
vi credentials.yml
```

Change all 'CHANGEME' values.

## Update Pipeline

```bash
fly -t jambudvipa set-pipeline -p pcf-sb-hello-world -c pipeline.yml --load-vars-from credentials.yml
```

## Watch Job

```bash
fly -t jambudvipa watch --job pcf-sb-hello-world/job-run-unit-tests --build 1
```
