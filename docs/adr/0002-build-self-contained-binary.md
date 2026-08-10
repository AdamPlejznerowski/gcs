# ADR-0002 - Build self contained binary
### Status
Accepted
### Context
- Current builds depend on dynamic system libraries.
- Target enviroments may have inconsistent library versions.
- Deployment often fails due to missing or mismatched dependencies.
- Debugging production issues complicated by external factors.
- Project need deployment that is immune to host system state.
### Decisions
- All dependencies will be compiled directly into the executable.
- Not relying on external shared libraries and dependencies at runtime and compilation stage.
- Build process guarantee a single, portable binary.
### Reasons
- It eliminates external dependencies.
- It ensures consistent behavior across all target environments.
- It removes risk of dependency hell during deployment.
- It prevents failures caused by host system updates and misconfigurations.
- It simplifies deployment artifact to a single binary.
- It guarantees that the tested binary is exactly what  runs in production.
### Consequences
- Binary size will increase.
- Memory usage may rise.
- Security patches to packages may require a full rebuild.
- Build times will increase due to this ADR.
- Deployment complexity will decrease significantly.