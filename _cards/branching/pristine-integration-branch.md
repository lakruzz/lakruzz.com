---
title:      Pristine integration branch
caption:    No offense, but you couldn't break the build even if you tried
level:      85
area:       vcs
visuals:    
throughput:
feedback:        
payback:   
simplicity:       
weight: 2005
---

To integrate means to merge your code on to the same branch as the one your colleagues are working on. 
So obviously if your code breaks something you are potentially jeopardizing the work space - and pace - of your team mates as well.  
To have a pristine integration branch means that it is _buildable_ at all times.

Code should be verified through some kind of toll-gate criteria, before it's accepted on to the integration branch. 
Anything that doesn't meet the toll-gate criteria is rejected and will not enter the mainline. 
It is simply impossible for a developer to _break the build_.
