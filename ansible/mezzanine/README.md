# Setup mezzanine on Ubuntu 14.04

## Install pip & virtualenv

  $ sudo apt-get install python-pip python-dev build-essential 
  $ sudo pip install --upgrade pip
  $ sudo pip install --upgrade virtualenv

## Install mezzanine

    $ sudo apt-get install libjpeg libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
    $ sudo apt-get build-dep python-imaging

Create venv and use. 

    $ virtualenv venv
    $ . venv/bin/activate

Install Pillow from GitHub.

    $ pip install git+https://github.com/python-pillow/Pillow.git

Install Django 1.8. (v1.8.11)

    $ pip install 'Django <1.9'

Install mezzanine.

    $ pip install mezzanine

## Deploy mezzanine website

Create project.

    $ mezzanine-project myproject

Create database (need input *username*, *password*, *email* ...).

    $ python manage.py createdb

### Run Django

* Local.

        $ python manage.py runserver

* Public.

        $ python manage.py runserver 0.0.0.0:8000


## Reference

* [安裝 Django | Django Girls 學習指南](https://djangogirlstaipei.gitbooks.io/django-girls-taipei-tutorial/content/django/installation.html)

