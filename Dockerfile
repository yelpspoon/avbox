FROM lscr.io/linuxserver/webtop:debian-mate

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y handbrake easytag wget xz-utils

#locked to v7.19
WORKDIR /tmp
RUN wget -O reaper.tar.gz https://www.reaper.fm/files/7.x/reaper719_linux_x86_64.tar.xz && \
    tar -xvf reaper.tar.gz

WORKDIR reaper_linux_x86_64
RUN ./install-reaper.sh --install "/opt" --integrate-desktop --usr-local-bin-symlink
RUN ls /mnt

EXPOSE 3000
