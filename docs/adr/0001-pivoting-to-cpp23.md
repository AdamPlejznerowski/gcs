# ADR-0001 - Pivot from GCS (C#) to GCPP (C+23)
### Status
Accepted
### Context
- Project and repository renamed from GCS (GNOME C Sharp) to GCPP (GNOME C Plus Plus).
- Runtime targets GNOME platform without JavaScript and serves as a alternative to GJS ecosystem.
- Build system migrated to Meson.
- Language migrated from C# to C++23.
- Supported compilers: GCC 16, Clang 22.
### Decisions
- Adopt C++23 as project implementation language.
- Replace existing C# codebase.
- Standardize build tool on Meson.
- Rename project and repository to GCPP
- Target GCC 16 and Clang 22.
### Reasons
- Improve stability.
- Improve maintainability.
- Improve predictability.
- Improve performance.
- improve ABI compatibility.
- Eliminatw non-deterministic garbage collection.
- Enable explicit allocation and lifetime management.
- Simplify reproduction of memory-related bugs.
- Remove boxing overhead.
- Reduce runtime boilerplate required by managed environment.
### Consequences
- Full rewrite required.
- Manual resource management required.
- Modern C++ tooling and compiler requirments increased.
- Highter implementation complexity.
- Lower runtime overhead.
- More deterministic execution model.
- Better long-term maintenance and integration with GNOME ecosystem.