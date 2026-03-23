# Problem Space

The current container pipeline faces significant velocity bottlenecks, especially when rebuilding existing containers at scale (such as for CVE remediation) and delivering brand new applications.  

Key issues include:  
- Local Build Bottlenecks: Currently, containers are being built locally rather than in a concurrent CI/CD environment.  
- Manual Intervention: Tedious processes require a human in the loop, such as manually specifying packages to ingest, creating new VEXes, and moving releases from staging to latest.  
- Legacy Dependencies: The pipeline still relies on the legacy platform projects, requiring retrofitting, mapping dependency data to the platform model, and complex solver adaptations.  


# Proposed Solution

The core objective is to make leveraging AI capabilities a main focus for automating tedious tasks, empowering developers to focus on high-level, human-centric work, and ultimately achieving faster delivery and velocity at scale.  

- Migrate to CI/CD: Replace local builds with concurrent CI/CD jobs for a massive velocity boost. To bypass Docker-in-Docker complications in this new environment, the build process will transition to alternative container building tools (Buildah is a great example, but the team is open to other alternatives).  
- Modernize Orchestration: Transition orchestration by leveraging common industry tools (such as justfile, uv, bazel, and maven as examples). The focus is not on the exact software used, but on using these types of industry-standard tools to create the right environment and toolset for AI to use.  
- Comprehensive AI Integration: By equipping AI with the right tools, it can work seamlessly with both legacy platform projects and the new build system right out of the gate, eliminating the need for a phased rollout. AI will be applied across the pipeline to handle build iterations, port ingredient data, suggest CVE remediations, and automate persistent VEXes, keeping a human in the loop only when strictly necessary.  
