FROM python:3.7
MAINTAINER  Anurag Guda <anuragmsu@gmail.com>
 
RUN mkdir -p /curator && \
    chmod 777 /curator
 
COPY bootup.sh /curator/bootup.sh
 
RUN chmod ug+x /curator/bootup.sh
 
WORKDIR /curator
 
RUN pip install elasticsearch-curator
 
CMD /bin/sh -c '/curator/bootup.sh'
