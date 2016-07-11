"""
Django settings for atividades project.

Generated by 'django-admin startproject' using Django 1.9.1.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'dt47u1s!8!_15729b9q1db=8lo*qw)%f!*uh0%30d$!8^uf)1h'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = '587'
EMAIL_HOST_USER = 'hall9000@ifpi.edu.br'
EMAIL_HOST_PASSWORD = 'srthedti@'
EMAIL_USE_TLS = True

USERS_PERMISSIONS_SENDER = ['tercio@ifpi.edu.br']

# Application definition

INSTALLED_APPS = [        
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',        
    'comum',
    'cron',
    #'reunioes',
    'tarefas'
]

MIDDLEWARE_CLASSES = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'atividades.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'comum.processors.projetos',
                'comum.processors.documentos'
            ],
        },
    },
]

WSGI_APPLICATION = 'atividades.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

DATABASES = {
    'default':{
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'gerencia_projetos',
        'USER': 'ifpi',
        'PASSWORD': 'srthedti@',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    },
    'classificatorio':{
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'classificatorioTeste',
        'USER': 'sa',
        'PASSWORD': 'ifpi@123',
        'HOST': '10.0.60.137',
        'PORT': '1433',
        'OPTIONS':{
            'driver':'SQL Server',
            'dsn':'sqlserverdatasource' # configurado no sistema operacional
        }
    }
}

# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/

LANGUAGE_CODE = 'pt-br'

TIME_ZONE = 'America/Fortaleza'

USE_I18N = True

USE_L10N = True

USE_TZ = False



# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/
#STATIC_ROOT = '/home/tercio/Projetos/Python/Django/atividades/static'

STATIC_URL = '/deploy/static/'
#MEDIA_ROOT = '/uploads/'

STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'/deploy/static'),
    '/home/tercio/Projetos/Python/Django/atividades/deploy/static',
]