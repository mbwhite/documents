**_work in progress_**

# Validation of the the quality of Fabric Composer

Fabric Composer is a open source technology that is developed in the open. Therefore every Pull Request that is merged is a *public* release of code, api and documentation. 

First impressions and the overall first experience do count. Even if something isn't perfect for whatever reason, then we can still retain this new relationship _if_ the solution is easily found. 

## Aim
To run over a weekly set of of User Exerpience centric exploratry testing.

## Objectives
Some prescriptive things to chec (see [Standard Verification](#standard-verification] below) - but a degree of explortory testing is good to find out the edge cases etc.

* Is the website instructions still up-to-date? 
* Do the prereqs still make sense - and can the setup scripts still work?
* Do the tutorials still work?
* Can I get started writing an application without having to make massive leaps?
.. etc.

## Playbooks

### Standard Verification 

Installation Verification for 0.4.5 (Mac OS X and Ubuntu)
- Pre-req install
- Run the QuickStart
- Yo Generator (Angular + CLI)
- Expose as REST API
- fabric-composer.mybluemix.net, import sample, execute
Tests should be driven from the public docs, to check they are updated.

### Ubuntu 14:04 LTS base & Ubuntu 16:04 LTS base

**Scenario:**  developer using clean basic image of Ubuntu, running the *Standard Verification* playbook. Can they get through to the end tutorial, including bluemix hosted.

### MacOS

**Scenario:** developer using a clean image of MacOS, running the *Standard Verification* playbook. Can they get through to the end tutorial, including bluemix hosted.   

> Community - how feasible is it to have a clean MacOS image?  So running on Windows 10 I can spin up Virtual Linux boxes without issue?  Could I test MacOS the same way? Or do we need a genuine mac laptop. 


