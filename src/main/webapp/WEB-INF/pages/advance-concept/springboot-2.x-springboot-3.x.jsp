
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Differences between Spring Boot 2.x and 3.x</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; }
        h1 { color: #333; }
        h2 { color: #0056b3; }
        ul { margin-left: 20px; }
        li { margin-bottom: 10px; }
    </style>
</head>
<body>
<h1>Differences between Spring Boot 2.x and 3.x</h1>

<h2>1. Java Version Support</h2>
<ul>
    <li><strong>Spring Boot 2.x:</strong> Supports Java 8 to 17.</li>
    <li><strong>Spring Boot 3.x:</strong> Requires Java 17 or higher.</li>
</ul>

<h2>2. Jakarta EE Namespace Changes</h2>
<ul>
    <li><strong>Spring Boot 2.x:</strong> Uses the old javax.* namespace for Jakarta EE (e.g., javax.servlet).</li>
    <li><strong>Spring Boot 3.x:</strong> Migrates to the jakarta.* namespace (e.g., jakarta.servlet) as part of Jakarta EE 9+ support.</li>
</ul>

<h2>3. New Features and Enhancements</h2>
<ul>
    <li><strong>Spring Boot 3.x:</strong> Adds support for GraalVM native images, enabling faster startup times and lower memory consumption.</li>
    <li><strong>Observability:</strong> Introduces Micrometer Observability to unify metrics, logging, and tracing support.</li>
</ul>

<h2>4. Spring Framework Version</h2>
<ul>
    <li><strong>Spring Boot 2.x:</strong> Built on Spring Framework 5.x.</li>
    <li><strong>Spring Boot 3.x:</strong> Built on Spring Framework 6.x, bringing new capabilities and improvements.</li>
</ul>

<h2>5. Removed/Updated Dependencies</h2>
<ul>
    <li><strong>Spring Boot 2.x:</strong> Some older libraries and dependencies are supported.</li>
    <li><strong>Spring Boot 3.x:</strong> Removes outdated libraries (e.g., Hibernate 5.x is replaced by Hibernate 6.x), and updates dependencies to modern versions.</li>
</ul>

<h2>6. Hibernate Support</h2>
<ul>
    <li><strong>Spring Boot 2.x:</strong> Supports Hibernate 5.x.</li>
    <li><strong>Spring Boot 3.x:</strong> Upgraded to support Hibernate 6.x with improved performance and features.</li>
</ul>

<h2>7. Docker Support Enhancements</h2>
<ul>
    <li><strong>Spring Boot 3.x:</strong> Enhanced Docker support with improved layers for native image generation and better multi-stage builds.</li>
</ul>

<h2>8. Security Enhancements</h2>
<ul>
    <li><strong>Spring Boot 3.x:</strong> Improved security with updated OAuth 2.0 and OpenID Connect support, and enhanced security-related features in Spring Security.</li>
</ul>

<h2>9. Gradle and Maven Plugin Updates</h2>
<ul>
    <li><strong>Spring Boot 3.x:</strong> Updates to Gradle 7.x and Maven plugins, ensuring compatibility with the latest build tools and enhanced configuration options.</li>
</ul>
</body>
</html>
