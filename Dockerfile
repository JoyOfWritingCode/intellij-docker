FROM ubuntu:latest

# Install Oracle JDK, see http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
RUN apt-get -qq install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -qq update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get -qq install oracle-java8-installer

# Install git
RUN apt-get -qq install git

# Install gradle, see http://askubuntu.com/questions/328178/gradle-in-ubuntu
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get -qq update
sudo apt-get -qq install gradle

# Install IntelliJ
RUN apt-get -qq install wget
RUN wget http://download.jetbrains.com/idea/ideaIC-14.1.4.tar.gz
RUN tar -zxvf ideaIC-14.1.4.tar.gz -C /opt
RUN rm ideaIC-14.1.4.tar.gz

# Install Graphics Packages
RUN apt-get -qq install libxi6 libxtst6 libxrender1

CMD ["./opt/idea-IC-141.1532.4/bin/idea.sh"]