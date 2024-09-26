# Demand Console GitHub Runner Provisioner

### This repo is made to help automate setup of self-hosted github actions workflow runner. 

`download.ps1` 
Covers the main logic of setting up the runner. It **does not**, however, bind it to your github account using a token. 
That is for you to do :) 

`configure.ps1`
This can be used to bind and activate the runner to your GitHub account. 
I personally recommend **all advanced users** to edit this file and replace `PLACEHOLDERTOKENDATAHERE` with your own token.
For non-advanced users, however, I have added the option to enter your token thru the script.


**NOTE** 
```
DO NOT FORGET TO ADD A .YML/YAML FILE IN THE `.workflow` FOLDER OF YOUR PREFFERED GITHUB REPO.
MAKE SURE THE NAME OF THE RUNNER CONFORMS TO THE NAME OF THIS RUNNER IF THAT'S WHAT YOU'RE USING.
```
_Notice: Repo will remain archived until an update is due. Versioned releases can be found in the [releases tab](https://github.com/blinkyboi/GHA-DMD-SH/releases)._

###### *Checkout this link for additional details*: [GH Docs](https://docs.github.com/en/actions/hosting-your-own-runners)
