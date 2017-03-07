# Use Ubuntu
FROM ubuntu



# Install wger & JRE
RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install \
				wget \
				default-jre-headless \
				telnet \
				iputils-ping \
				unzip

# Install jmeter
RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz \
      && tar -xzf apache-jmeter-2.13.tgz \
      && rm apache-jmeter-2.13.tgz \
	  
# Install plugins
# - JMeterPlugins-Standard
# - JMeterPlugins-Extras
# - JMeterPlugins-ExtrasLibs

	  && mkdir /jmeter-plugins \
	  && cd /jmeter-plugins/ \
	  && wget https://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.4.0.zip \
	  && unzip -o JMeterPlugins-ExtrasLibs-1.4.0.zip -d /jmeter/apache-jmeter-2.13/ \
	  && wget https://jmeter-plugins.org/downloads/file/ServerAgent-2.2.1.zip \ 
	  && unzip -o ServerAgent-2.2.1.zip -d /jmeter/apache-jmeter-2.13/ \
	  && wget -q http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.4.0.zip \
	  && unzip -o JMeterPlugins-Standard-1.4.0.zip -d /jmeter/apache-jmeter-2.13/ \
	  && rm *.zip
	  

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-2.13/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

