---
---

### Vague build infrastructure and hardware utilization

The server room setup with its mixture of VMware, Docker and physical machines isn't very clear. 
For Unix based builds, historically, VMWare with SAN used for storage doesn't perform very well due to general I/O problems.
You also have one overloaded Windows machine running.
Despite new servers having been ordered, given the fact that many builds will run simultaneously on the same hardware, will it solve the scalability problem? 
Will the builds again face the I/O problem but at a different level?

#### Develop a strategy on to utilize your hardware better (S)

Create an infrastructure strategy and plan to utilize the current and future hardware configuration to get the best scalability and ROI.
For the same price, will multiple mid range servers scale better than a single high-end server?

