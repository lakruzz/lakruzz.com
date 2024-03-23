---
---

### Windows server is not managed

The Windows machine and its tools aren't versioned or managed.

#### Script the installations - including on Windows (M)

It is advised to start using a CMS like Ansible, Chef or Puppet to document and execute installations, much like you would in Docker. 
Consider also using it for setting up the developer machines.

#### Virtualize your Windows machines (S)

Even though UR is getting new hardware, it's advised to run virtual machines on top of the physical hardware.
This makes them easier to deploy, move around and spin up, while also allowing you to better utilize your total hardware pool.
The developers can also use the virtual images as the base for their development environments.

### Docker images are not managed

Docker images are built every time they are used.
This isn't very efficient, but more importantly, the content changes over time as the underlying base image and tools change version. 
You _need_ to know the exact state your images are in.

#### Implement Docker Registry (M)

Implement Docker Registry to manage your Docker images and their bases. 
It is important for reproducibility, reusability and efficiency. 
Your CI system and developers should be able to use the _exact_ same Docker images.
