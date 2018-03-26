# pirl-microcredential

## Background Information
This is a B-to-B contract that allows an authorizing agent to receive micro-credential validation requests.  For example, in certain industries, employees are encouraged to obtain "Micro-Credentials".  A micro-credential is a small certification that indicates you have mastered a small skill.  If we take K12 education, as an example:

A school district might create a micro-credentail specification for "Classroom Management" that would require the teacher to:
* Attend 2 particular professional development classes.
* Submit a picture of their room before and aftre the class.
* Write a summary of how the changes impacted behavior in the classroom.

The teacher would complete these items and submit them for approval, from the district.  

The glaring problem in all of this is that every district creates their own requirements and standards for what it means to obtain the "Classroom Management" micro-credential.  Fortunately, there are certain agencies within the K12 market that have are competing to establish themselves as the best-practice authority on certain microcredentials.  For example, the NEA Teacher's union might release their own standards for "Classroom Management".  A district may wish to let their teachers submit an in-district Micro-Credential to one of these agencies for a more pertinent review.

Fortunately, there is a specification that outlines how these micro-credentials are organized in a standardized way.  A simple XML file is use to define the requirements and hold the list of things that were done.  In a simplified manner, this looks like:

```xml
<root>
  <title>Classroom Management</title>
  <requirements>
    <blah>Blah</blah>
  </requirements>
  <evidence>
    <blah>Some file</blah>
  </evidence>
  <educator>
    <firstname>Joe</firstname>
    <blah>Blah</blah>
  </educator>
</root>
```

This smart contract will create a relationship between the authorizing agency's wallet address and the districts wallet address.  This wil allow the district to submit a micro-credentail review (including supporting files) for a particular educator.  The authorizing agency will then review the work and see how it aligns to their best-practice specification.  Once approved, the user will have a link they can share with anyone in the world, that validates they've received a worthy micro-credential from an established authorizing agency.


## Proposed Contract Files
* /MicroCredential.sol - Main point of entry.  Each authorizing agent will own the contract.
* /Subscribers.sol - This is where a school district will add their address and name.
* /Credentials.sol - This is where a school district will add a credential
* /Files.sol - This is where a school district will add the supporting evidence for a given credential.
* /Common.sol - Common utility functions


## Milestones / Timeline
* Re-Learn Solidity Development
* Create skeleton structure of contract and library files
* Create/understand development environment
* Write tests for the various functions
* Build out contracts
* Build UI
* Test


## Team
Michael Murphy - Developer / Product Manager
