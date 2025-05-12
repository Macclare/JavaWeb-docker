# Use an official Tomcat image as a base image
FROM tomcat:9-jdk11-openjdk

# Copy the WAR file into Tomcat's webapps directory (relative path from Docker build context)
COPY target/WebAppCal-0.0.6.war /usr/local/tomcat/webapps/WebAppCal-0.0.6.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
