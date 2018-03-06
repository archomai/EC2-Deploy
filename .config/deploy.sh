#!/usr/bin/env bash
export DJANGO_SETTINGS_MODULE=config.settings.production
# Nginx에 존재하던 모든 enabled서버 설정 링크 삭제
sudo rm -rf /etc/nginx/sites-enabled/*
# 프로젝트의 Nginx설정 (nginx-app.conf)를 복사
sudo cp -f /srv/ec2-deploy/.config/nginx-app.conf /etc/nginx/sites-available/nginx-app.conf
# 복사한 Nginx설정을 enalbed에 링크
sudo ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
# uWsGI서비스 파일을 /etc/systemd/system폴더에 복사
sudo cp -f /srv/ec2-deploy/.config/uwsgi.service /etc/systemd/system/uwsgi.service

# collectstatic을 위한 과정
cd /srv/ec2-deploy/app
# ubuntu 유저로 collectstatic 명령어를 실행 (deploy 스크립트가 root권한으로 실행되므로)
/bin/bash -c \
'/home/ubuntu/.pyenv/versions/fc-ec2-deploy/bin/python \
/srv/ec2-deploy/app/manage.py collectstatic --noinput' ubuntu

# uwsgi, nginx를 재시작
sudo systemctl enable uwsgi
sudo systemctl daemon-reload
sudo systemctl restart uwsgi nginx