FROM jenkins/jenkins:lts
 
USER root
RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y ruby gcc g++ make
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN sudo bash nodesource_setup.sh
RUN sudo apt install nodejs

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
