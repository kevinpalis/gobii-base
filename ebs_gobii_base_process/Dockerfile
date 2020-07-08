FROM gadm01/ebs_gobii_ubuntu:latest
RUN apt-get update -y && apt-get install -y gnupg2
RUN apt-get install software-properties-common build-essential zlib1g-dev -y libbz2-dev liblzma-dev
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
RUN apt install -y zulu-13
RUN apt-get -y install coreutils
RUN apt-get -y install python2.7-dev
RUN apt-get -y install python-psycopg2
RUN apt-get -y install curl
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install Numpy
RUN pip install pandas
COPY config.sh /root
RUN chmod 755 /root/config.sh
USER gadm
RUN curl -L http://xrl.us/installperlnix | bash
RUN /home/gadm/perl5/perlbrew/bin/cpanm Text::CSV
RUN /home/gadm/perl5/perlbrew/bin/cpanm Canary::Stability
RUN /home/gadm/perl5/perlbrew/bin/cpanm JSON::XS
RUN /home/gadm/perl5/perlbrew/bin/cpanm Switch
RUN cd /home/gadm; wget https://github.com/samtools/htslib/releases/download/1.4/htslib-1.4.tar.bz2
RUN cd /home/gadm; wget https://github.com/samtools/bcftools/releases/download/1.4/bcftools-1.4.tar.bz2
RUN cd /home/gadm; tar -xjf htslib-1.4.tar.bz2
RUN cd /home/gadm; tar -xjf bcftools-1.4.tar.bz2
RUN cd /home/gadm; mv htslib-1.4 htslib
RUN cd /home/gadm; mv bcftools-1.4 bcftools
RUN cd /home/gadm/bcftools; make
RUN cd /home/gadm; wget https://s3.us-east-2.amazonaws.com/gobii-archives/vcftools_0.1.13.tar.gz
RUN cd /home/gadm; tar -xzf vcftools_0.1.13.tar.gz
RUN cd /home/gadm/vcftools_0.1.13; make
RUN echo export PERL5LIB=/home/gadm/vcftools_0.1.13/perl >> /home/gadm/.bashrc
RUN echo export PATH=$PATH:/home/gadm/vcftools_0.1.13/bin/ >> /home/gadm/.bashrc
RUN ["/bin/bash", "-c", "source /home/gadm/.bashrc"]
USER root
ENTRYPOINT ["/root/config.sh"]