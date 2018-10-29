FROM python:2.7
MAINTAINER Peter Kone <dongbeiouba@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
git python-mysqldb --no-install-recommends

RUN git clone https://github.com/sqlmapproject/sqlmap.git

WORKDIR /sqlmap
VOLUME /data

CMD ["—h"]
ENTRYPOINT ["./sqlmap.py"]

