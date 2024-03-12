# FIAP - SOAT - Tech Challenge - Terraform / EKS

Repositório exclusivo para provisionamento da infraestrutura para a aplicação fiap-tech-challenge-soat em ambiente AWS.

### Terraform AWS

Verifique as configuracoes do versions.tf e coloque o s3 e tabela do dynamodb para o lock

```
  backend "s3" {
    bucket         = "api-gateway-tf-state2"
    key            = "api-gateway/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-terraform-fiap-tech-lock"
  }
```

Deploy: 
```
terraform init
terraform plan
terraform apply
```


### EKS + localstack
Dentro do diretorio ```local-eks``` se encontra os arquivos do EKS, sendo possivel executar localmente junto do localstack:

Para executar todos os MS localmente:
```bash
kubectl apply -R -f local-eks/
```
- Deve realizar o build e o push de todas as imagens dos microservicos
- ***Em caso de deploy sem o localstack deve se atualizar  o ```secrets.yml``` e subir sem o deployment da pasta localstack***
