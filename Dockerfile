FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl gnupg firefox
RUN apt-get install apt-transport-https -y && \
curl https://download.videolan.org/pub/debian/videolan-apt.asc | apt-key add - && \
echo 'deb https://download.videolan.org/pub/debian/stable ./' | tee /etc/apt/sources.list.d/libdvdcss.list && \
apt-get update && \
apt-get install curl gnupg mplayer alsa-base alsa-utils -y
RUN apt-get update && apt-get install -y \
	dirmngr \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
	apulse \
	ca-certificates \
	ffmpeg \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	fonts-noto \
	fonts-noto-cjk \
	fonts-noto-color-emoji \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

CMD /usr/bin/firefox