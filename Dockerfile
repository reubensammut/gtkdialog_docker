FROM debian
RUN apt-get update
RUN apt-get install -qqy x11-apps zip texinfo curl libgtk2.0-dev bison flex
RUN mkdir -p /opt/scripts
WORKDIR /opt/scripts
RUN curl -X GET https://github.com/puppylinux-woof-CE/gtkdialog/archive/refs/heads/master.zip -k -L -o gtkdialog.zip
RUN unzip gtkdialog.zip
WORKDIR /opt/scripts/gtkdialog-master
RUN ls -al
RUN pwd
RUN chmod +x autogen.sh
RUN ./autogen.sh
RUN make && make install
WORKDIR /
ENV DISPLAY :0
CMD xeyes
