"""
Config module.
"""


class OmicsDM_Server_Config(object):

    # DB
    SQLALCHEMY_DATABASE_URI = "postgresql://postgres:password@IP/postgres"
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Auth
    SECRET_KEY = "othrt-some-secret-string"
    JWT_SECRET_KEY = "jwt-secret-string"
    JWT_OPTIONS = {"verify_exp": False, "verify_aud": False}

    AUTH_BASE_URL = "http://localhost:8080"
    AUTH_REALM = "Shinyproxy"
    IDRSA = "MIIB..."

    # S3 (in the past Ceph was employed)
    CEPH_URL = "http://localhost:9000/"
    BUCKET_NAME = "bucketdevel3tr"

    ACCESS_KEY = "accesskey"
    SECRET_KEY = "secretkey"

    # Analysis
    REDIS_HOST = "localhost"
    REDIS_PORT = 6379

    CELERY_BROKER_URL = "amqp://admin:PASSWORD@IP:PORT//"
    CELERY_RESULT_BACKEND = f"redis://{REDIS_HOST}:{REDIS_PORT}/0"
    CELERY_TRACK_STARTED = True
