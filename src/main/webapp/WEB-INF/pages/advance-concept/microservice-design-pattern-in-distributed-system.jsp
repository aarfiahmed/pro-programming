<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Design Patterns in Distributed Systems</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        h1 {
            color: #2c3e50;
        }
        h2 {
            color: #34495e;
        }
        ul {
            list-style-type: none;
            padding-left: 0;
        }
        li {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<h1>Design Patterns in Distributed Systems</h1>

<ul>
    <li>
        <h2>1. Ambassador Pattern</h2>
        <p>Description: Offloads common network-related tasks like routing or security to a proxy.</p>
        <p>Use Case: Handling external communication, SSL termination, or retry policies.</p>
    </li>

    <li>
        <h2>2. Adapter (Wrapper) Pattern</h2>
        <p>Description: Allows incompatible interfaces to work together by wrapping an object.</p>
        <p>Use Case: Integrating legacy services with modern microservices or API transformation.</p>
    </li>

    <li>
        <h2>3. Strangler Pattern</h2>
        <p>Description: Gradually migrate a legacy system by replacing pieces of functionality step by step.</p>
        <p>Use Case: Migration from monolithic to microservices architecture.</p>
    </li>

    <li>
        <h2>4. Aggregator Pattern</h2>
        <p>Description: Gathers data from various services and returns a consolidated response.</p>
        <p>Use Case: Consolidating multiple service responses in APIs.</p>
    </li>

    <li>
        <h2>5. Proxy Pattern</h2>
        <p>Description: Acts as an intermediary to add security, caching, or throttling before passing a request.</p>
        <p>Use Case: Security, performance optimization, or load balancing in microservices.</p>
    </li>

    <li>
        <h2>6. Bulkhead Pattern</h2>
        <p>Description: Isolates components to limit failure impact on the system.</p>
        <p>Use Case: Preventing cascading failures in microservices.</p>
    </li>

    <li>
        <h2>7. Circuit Breaker Pattern</h2>
        <p>Description: Prevents application calls to an unstable service, improving fault tolerance.</p>
        <p>Use Case: Reducing performance degradation by avoiding repeated failures.</p>
    </li>

    <li>
        <h2>8. Retry Pattern</h2>
        <p>Description: Retries failed operations due to transient faults, with optional backoff strategies.</p>
        <p>Use Case: Communicating with unreliable external systems for improved reliability.</p>
    </li>

    <li>
        <h2>9. Gateway (API Gateway) Pattern</h2>
        <p>Description: Centralizes client requests to multiple services and aggregates responses.</p>
        <p>Use Case: Managing cross-cutting concerns like authentication and request routing.</p>
    </li>

    <li>
        <h2>10. Saga Pattern</h2>
        <p>Description: Manages distributed transactions as a series of steps with compensating actions for failures.</p>
        <p>Use Case: Ensuring data consistency in distributed systems without global transactions.</p>
    </li>

    <li>
        <h2>11. Event Sourcing Pattern</h2>
        <p>Description: Stores state-changing events to reconstruct the current state by replaying these events.</p>
        <p>Use Case: Auditing, debugging, and ensuring data consistency.</p>
    </li>

    <li>
        <h2>12. CQRS (Command Query Responsibility Segregation) Pattern</h2>
        <p>Description: Separates read and write operations for a data store using different models.</p>
        <p>Use Case: Handling complex queries or high read/write separation in systems.</p>
    </li>

    <li>
        <h2>13. Anti-Corruption Layer Pattern</h2>
        <p>Description: Introduces a layer to shield new systems from legacy complexities, translating data.</p>
        <p>Use Case: Integrating legacy systems without technical debt affecting the new system.</p>
    </li>

    <li>
        <h2>14. Service Discovery Pattern</h2>
        <p>Description: Automatically detects and manages network locations of services dynamically.</p>
        <p>Use Case: Dynamically finding services in distributed microservices architectures.</p>
    </li>

    <li>
        <h2>15. Blue-Green Deployment Pattern</h2>
        <p>Description: Runs two identical environments, shifting live traffic after updates are complete.</p>
        <p>Use Case: Minimizing downtime and reducing deployment risks during updates.</p>
    </li>

    <li>
        <h2>16. Leader Election Pattern</h2>
        <p>Description: Services elect a leader to manage coordination and resource allocation.</p>
        <p>Use Case: Distributed clusters assigning roles or managing resources.</p>
    </li>

    <li>
        <h2>17. Throttling Pattern</h2>
        <p>Description: Limits the number of requests a service can handle, preventing overload.</p>
        <p>Use Case: Maintaining system performance during high-traffic periods.</p>
    </li>

    <li>
        <h2>18. Sharding Pattern</h2>
        <p>Description: Partitions data across servers to improve scalability and performance.</p>
        <p>Use Case: Handling large-scale data volumes in distributed systems.</p>
    </li>

    <li>
        <h2>19. Sidecar Injection</h2>
        <p>Description: Automatically injects a sidecar component into a service during deployment.</p>
        <p>Use Case: Used in service meshes for automatic proxy injection (e.g., Envoy).</p>
    </li>

    <li>
        <h2>20. Twelve-Factor App Pattern</h2>
        <p>Description: A methodology for building scalable, maintainable, and portable cloud-native applications.</p>
        <p>Use Case: Following best practices for development and deployment of cloud-native apps.</p>
    </li>
</ul>

</body>
</html>
