# Use a minimal Java runtime image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /pro-programming

# Copy the JAR file from the target directory to the container
COPY target/pro-programming-1.war pro-programming.war

# Expose the application port (change as per your application)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "pro-programming.war"]
