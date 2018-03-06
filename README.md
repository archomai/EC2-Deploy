
# EC2 Deploy project

AWS의 EC2 배포를 연습하는 프로젝트입니다.
`.secrets`폴더내의 파일로 비밀 키를 관리합니다.

DB로 PostgreSQL을 사용하며, `local`환경에서는 `localhost`의 DB, `dev`환경과 `production`환경에서는 `AWS RDS`의 DB를 사용합니다.

## Requirements

- Python (3.6)
- PostgreSQL

## Installation

```
pip install -r requirements.txt
```

## Secrets

**`.secrets/base.json`**

```json
{
  "SECRET_KEY": "<Django settings SECRET_KEY value>"
}
```

**`.secrets/local.json`**

```json
{
  "DATABASES": {
    "default": {
      "ENGINE": "django.db.backends.postgresql",
      "HOST": "localhost",
      "NAME": "<DB name>",
      "USER": "<DB username>",
      "PASSWORD": "<DB user password>",
      "PORT": <Port number, default:5432>
    }
  }
}
```

**`.secrets/dev.json`**

```json
{
  "DATABASES": {
    "default": {
      "ENGINE": "django.db.backends.postgresql",
      "HOST": "<자신의 RDS주소. ex)instance-name.###.region.rds.amazonaws.com>",
      "NAME": "<DB name>",
      "USER": "<DB username>",
      "PASSWORD": "<DB user password>",
      "PORT": <Port number, default:5432>
    }
  }
}
```