# Use Cases for Micro-Credentail Smart Contract



# Top-Level Organization Instantiates a Contract
Background:  The contract will be instantiated by the agency/organization that would like to receive and approve micro-credentail requests from end users. For the purpose of this and all use cases, we will pretend that this organization it something like the ETS (Educational Testing Service).  This is the organization (in the US) that administers the SAT, ACT and Praxis tests.  They have an army of graders that score written text and other data against a rubric.

  * ETS representative visit web page at http://www.micro-credentails-r-us.com
  * ETS representative sees an informative screen explaining the product.
  * ETS representative purchases some PIRL (oy)
  * ETS representative clicks a button to start the contract.
  * ETS representative is prompted to input the following information:
    * Organization name, address, phone, email, contact person, website
    * Cost per micro-credentail review (in Pirl)
    * The "Owner" of the contract is the ETS wallet address.
  * The Pirl Smart contract is instantiated and setAddress(), setPhone(), setWebsite(), setFeeInPirl() are called/set.
    * Note:  At some point, we have to have an adult conversation about currencies.  No one should have to know what Pirl is, but that little details will be left to another time.
  * ETS representative is redirected to a new page that is dedicated to their contract.  This is the page that they will link or embed in their own website.  This is what will let teachers interact with the contract.

# Top-Level Organization Adds Micro-Credentials
  * ETS representative visits a web page that allows them to interact with the contract.
  * Because they are the owner, they will see the functions to:
    * Add a micro-credential
    * View a list of micro-credentials
    * Archive a micro-credential
  * ETS representative clicks 'ADD A MICROCREDENTIAL' and they are prompted to input:
    * A title  ("Classroom Managment for High School")
    * A code ("CLM-09-12")
    * Clicking submit will call the OnlyOnwer addMicroCredential() function
  * The EST representative may archive any micro-credential by clicking the title and then clicking 'archive' which will call the OnlyOwner() archiveMicroCredential


# Teacher/End User Registers an Account
  * Teacher visits ETS website and follows link to the Micro-Credentail-Review center.
  * Teacher clicks 'Register' and is prompted for their:
    * Name, school district affiliation (optional), home address, phone, email, jobtitle, grade
    * Pirl wallet address (Not really sure how this part works and if we assume MetaMask exists)
  * Candidly . . . I don't quite understand how the teacher (known techno-phones) will interact with the contract in a usable way.

# Teacher Submits Micro-Credential
  * Teacher visits ETS website and follows link to the Micro-Credentail-Review center.
  * The Teacher is smart enough to be using MetaMask, so the page already knows who is logged in and shows the teacher the following info:
    * Their current list of approved micro-credentials 
    * Their current list of in-pregress micro-credentails
    * Add new Credential button
  * After the teacher clicks the "Add New Micro-Credential" button, the are prompted for:
    * Pick a micro-credential (call getMicroCredentaisl())
    * Upload the micro-credentail file 
      * This is a standardized XML-formatted file.  The teacher won't need to know XML.  Their in-district micro-credentail application system will likely provide them with this 'micro-credentail' file.
    * After clicking Submit, the addMicroCredentail() function will be called which will set the MicroCredentails stats = 'In Progress' and will upload the XML file to the content/file repo.






