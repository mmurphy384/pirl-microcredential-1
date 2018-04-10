# pirl-microcredential

## Background Information
This is a B2C Pirl Smart Contract that allows an authorizing agent to receive micro-credential validation requests from end users.  For example, in certain industries, employees are encouraged to obtain "Micro-Credentials".  A micro-credential is a small certification that indicates you have mastered a small skill.  If we take K12 education, as an example:

A school district might create a micro-credentail specification for "Classroom Management" that would require the teacher to:
* Attend 2 particular professional development classes.
* Submit a picture of their room before and aftre the class.
* Write a summary of how the changes impacted behavior in the classroom.

The teacher would complete these items and submit them for approval, within the district.  

The glaring problem in all of this is that every district creates their own standards for what it means to obtain the "Classroom Management" micro-credential.  

Fortunately, there are certain agencies within the K12 market that have are competing to establish themselves as the best-practice authority on certain microcredentials.  For example, the NEA Teacher's Union might release their own best-practice standards for "Classroom Management".  A teacher may wish to submit their district-approved Micro Credential to one of these agencies for a more pertinent review/endorsement.  If approved, the teacher will have a link to a badge or a certificate that will acknowledge the completion of their micro-credential.

Fortunately, there is a specification that outlines how these micro-credentials are organized in a standardized way.  A simple XML file is use to define the requirements for the micro-credential.  In a simplified manner, this looks like:

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

This smart contract will be instantiated and owned by the authorizing agent (The "NEA Teachers Union" in our example).  Teachers will register with the contract and submit one or more micro-credential review requests.  The authorizing agency will then review the work and see how it aligns to their best-practice specification.  Once approved, the user will have a link they can share with anyone in the world, that validates they've received a worthy micro-credential from an established authorizing agency.


## Proposed Contract Files
TO BE COMPLETED


## Milestones / Timeline
* Re-Learn Solidity Development
* Create/understand development environment
* Create skeleton structure of contract and library files
* To be determined


## Team
  * @CableGod - Developer
  * @kurret - Developer
  * @mmurphy384 - Developer / Product Manager
    * I'm a well-aged developer that has gotten through the cynical phase.  I'm a better project manager than a developer, so I'll probably stick to that role as we navigate through this project.  I spent most of my career in legacy technologies, but have dabbled in enough of the new stuff to talk a good game.  I live in the US in Severna Park, Maryland.  It's about a 30 minute drive to Washington DC.  I'm GMT - 4.
