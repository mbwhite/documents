**_work in progress - to do items are_**

 - Produce checklist tempalte that can be copied into a work item for recording checks
 - Running against pre-release webui is easy
 - Pure re-release cmd line is harder as need to make npm pick up the prerelease modules - may need to 'finesse' lerna
 - Get the labs from the Enagement to ensure that we targeting correct areas..
 - .... 

# Validation of the the quality of Fabric Composer

Fabric Composer is a open source technology that is developed in the open. Therefore every Pull Request that is merged is a *public* release of code, api and documentation. 

First impressions and the overall first experience do count. Even if something isn't perfect for whatever reason, then we can still retain this new relationship _if_ the solution is easily found. 

## Aim
To run over a weekly set of testing that ensures we meet a Minimal Standard for Release.

## Objectives
There are prescriptive things to check (see [Standard Verification](#standard-verification) - but a degree of explortory testing is good to find out the edge cases etc.

* Is the website instructions still up-to-date? 
* Do the pre-reqs still make sense - and can the setup scripts still work?
* Do the tutorials still work?
* Can I get started writing an application without having to make massive leaps?

In addition an objective is to find and close gaps that have been found within the testing. 

## Playbooks

### Pre-requisties

__Assumption__ that stories have been closed off properly

- [ ] Current state of the build is green with all test passing, and all aspects green:  This is for a merge build, not a pull request.
   - This ensures that the code is clean, unit and systests are passing, documentation is being generated, npm and docker images pushed to the repositories, and the Bluemix images have been pushed
- [ ] Ensure that any CRON jobs that are run are also passing

### Standard Verification 

Cmd line Installation Verification for 0.4.5 (Mac OS X and Ubuntu). These test should be run following the instructions in the web pages. _[ working theory that we should be able to extract from the markdown the commands used and run them. Therefore ensuring we test what we actually tell people to be doing]_

- [ ] Running the prereq scripts on clean platform images
- [ ] Run the QuickStart and follow on tutorials to ensure they are correct
- [ ] Yo Generator (Angular + CLI) - generates and the code runs succesfully
- [ ] Expose as REST API tutorial

Documentation

- [ ] Is the overall initial presentation of the website sound?  No broken links of home page (use w3 tools to check)
- [ ] Are the JSDocs being produced and linked correctly
- [ ] Look over the support pages, and the getting started tutorials; are their omissions broken links etc.  

### Playground

Currently there are the two version of the Playground. The developer preview, and the beta for the final version.

 - http://fabric-composer-unstable.mybluemix.net/
 - http://fabric-composer-next-unstable.mybluemix.net/  [URL might be changing soon]

(The stable versions of those are missing the unstable word - but these are already released).

The developer preview is still being used for a number of lab workshops, so it still needs to be functional.
(check with Matt L, what the sample labs they have are using and try and match one of those)

 - [ ] Connect to the playground [users.... admin.... create new user... ???]
 - [ ] Review model, and submit transaction
 - [ ] Update model, redploy, and submit updated transaction on that model
 
 - Running the Car Auction scenario would be a good one to attempt here. 

### Exploratory Testing

Different users will attempt different things, be starting from different points with different skill level. Options to consider

 - Add a new asset type to a model and a new transaction, or write a new model from a different business domain
 - Review the questions found in the week on StackOverflow & Rocket.Chat - how did the user get to the position they are in?
 - What new PRs have gone in this week - how could they deployed and used in the existing networks?

##Platforms

We need to validate on a number of platforms. 

### For the command line tests

 - Ubuntu 14:04 & Ubuntu 16:04
 - MacOS 10
 - _windows 10 is not yet ready_

 - Bluemix deployed as docker images??

### For the playgrounds

 - Both playgrounds need to be validated; developer preview focussed on the existing labs
 - Chrome, Safari, Firefox, Edge (IE is not a concern)
 
 
 
