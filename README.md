# README #

![Alt text](https://thumbnails-photos.amazon.com/v1/thumbnail/BoKZcnoqRbu1FA5S-pq0FQ?viewBox=860%2C430&ownerId=A3RL6H4CGV9EDF&groupShareToken=3nBmqRPHRkOSNoFCzXXJxA.g3lrRb25_s0FjHtiFfscnu "GOBii Project")
TODO: Add EBS Logo

# EBS-GOBii Base Docker Containers

This repository holds all the dockerfiles and config scripts that create the base containers for EBS-GOBii. They contain requisite software installed on an Ubuntu 18.04 LTS image.
These base containers are taken by Bamboo CI/CD pipeline to run builds and integration on. After a successful build, new containers are created with the latest EBS-GOBii changes.

TODO: List and describe all sub-directories

### Contribution guidelines ###

* Changes to the Dockerfiles
	Ideally, the Dockerfiles here should barely change once they get to a stable version. Any changes should be approved by Kevin Palis <kdp44@cornell.edu> and thoroughly tested before being merged to the master branch. The corresponding modifications should also be made in Bamboo.
* Code review
	Once the tag 1.0 is in place, ie. the Dockerfiles are funtional and stable, no direct merge to the master branch will be allowed. All changes should follow the gitflow workflow and a corresponding PR should be created for every merge request.
* Other guidelines
	These Dockerfiles and configuration scripts are foundational to the EBS-GOBii software. They contain required tools for the build system to work, ex. postgres, Java, Python, and as such unless there is a huge change in the architecture, these files should not be modified.

### Who do I talk to? ###

* Kevin Palis <kdp44@cornell.edu>
