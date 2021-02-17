# Have Fun by Mining Ethereum with AWS EC2 Spot instances

This repository contains a Cloudformation template to deploy a fleet of Spot EC2 instances with enough code to bootstrap and start mining efficiently and automatically.

### Disclaimer:

In general terms, mining cryptocurrencies in the cloud is not profitable, even with spot instances as the author stated in the initial post, now deleted.

The cost of cloud services, in this particular problem is broken down into:

* The cost of traffic
* The cost of storage
* The cost of computation

The spot instances are substantially cheaper of course, but their availability is subject to specific restrictions and conditions that do not always allow immediate access (a bidding system specifically(. Additionally in AWS there are soft limits (configurable via manual request), about the maximum number of instances that a user can raise without proving the reason.

These impediments can be overcome, but the final bill for traffic and storage does not allow an easy return on investment.

For this and other reasons, **I do not recommend the use of this template for cryptocurrency mining**, but as a practice exercise or basis for other templates that use similar resources.

### Architecture:

![architecture](https://cdn-images-1.medium.com/max/800/1*jk1iOT_yh-SqD1JUlMWc1g.png "Architecture of the solution")

### Sources:

* (Deleted) https://medium.com/@james.s.wiggins/get-rich-quick-by-mining-ether-with-aws-spot-c7b7a3bdc149
* (Archive Copy) https://web.archive.org/web/20171009083734/https://medium.com/@james.s.wiggins/get-rich-quick-by-mining-ether-with-aws-spot-c7b7a3bdc149
