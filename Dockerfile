FROM debian:stable-slim
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y wget bzip2
WORKDIR /tmp/
# Download Firefox
RUN wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/100.0.2/linux-x86_64/en-CA/firefox-100.0.2.tar.bz2
RUN tar xvjf *.bz2
# Download Firefox Selenium driver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz
RUN tar xvzf *.gz
RUN chmod +x geckodriver

FROM debian:stable-slim
ENV DEBIAN_FRONTEND noninteractive
COPY --from=0 /tmp/firefox /usr/bin/
COPY --from=0 /tmp/geckodriver /usr/local/bin/
ENV PATH "${PATH}:/usr/bin/firefox"
RUN apt update && apt -y install libgtk-3-0 libasound2 libdbus-glib-1-2 libx11-xcb1
RUN apt -y install python3.9-minimal python3-pip
RUN pip3 install selenium
CMD ["python3"]
