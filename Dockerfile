# docker build -t ec2-deploy -f Dockerfile .
FROM            ec2-deploy.base

COPY            . /srv/project

# nginx 설정 파일 복사 및 링크
RUN             cp -f /srv/project/.config/nginx.conf /etc/nginx/nginx.conf
RUN             cp -f /srv/project/.config/nginx-app.conf /etc/nginx/sites-available/
RUN             rm -f /etc/nginx/sites-enabled/*
RUN             ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/

# supervisord 설정파일 복사
RUN             cp /srv/project/.config/supervisord.conf /etc/supervisor/conf.d/

# supervisor를 실행
CMD             pkill nginx; supervisord -n