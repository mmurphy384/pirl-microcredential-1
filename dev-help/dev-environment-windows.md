# Smart Contract Development on Windows with Visual Studio



## Purpose
The purpose of this guide is to help new-to-Pirl developers set up a development environment using a Windows machine, running Visual Studio.  Let's try to keep this lean-and-mean.  No need to have 100 links.  Let's just have the top 10 resources for devleoping on Windows.



## 1. Using Visual Studio
There's a solidity extention available for VS 2015 and can be found here: https://marketplace.visualstudio.com/items?itemName=ConsenSys.Solidity . This can be used for Syntax highlighting and test compiling a contract. Due to an issue with deploying to block we don't use the built int "Deploy smart Contract"

To deploy a smart contract you can use ganache-cli as the RPC service and user truffle to deploy. Both of these can be installed using npm with nodeJS.
Ganache - https://github.com/trufflesuite/ganache-cli
truffle - https://github.com/trufflesuite/truffle

If you wish to add truffle into VS right click menus you can do so by create a .BAT file with the required ganacge/truffle command (ie. truffle compile && truffle migrate --reset) and then create an "External Tool" from the "Tools" menu.

Tip: when creating the external tool use "$(ItemDir)" as the initial directory (help tuffle stuff work) 

To add an external tool to a menu take note what # the tool is in the list (needed to add to right click menu). After you have the number, goto the "Tools" menu click "Customize". Once there goto the "Commands" tab and click the "Menu Contxt" option. From there you can select which menu context you wish to add the menu item to ("Project Solution Context Menu | Item" and "Project Solution Context Menu | Folder" are likely the ones you would use). Once you selected the right context menu click "Add Command" and goto the "Tools" sections and add your "External Tool #" command.

I personally recommed the following commands:
- ganache-cli -e 100000 -l 4712388 -d --noVMErrorsOnRPCResponse
- truffle init
- truffle compile && truffle migrate --reset

## 2. Using Visual Studio Code
There are packages that will help with linting and other tasks (security, compiling).  I'm going to follow this in my own development and will add to this bullet as I learn:
https://medium.com/@wslyvh/get-started-with-ethereum-solidity-on-windows-1672e9953a1 


## 3. Using Ubutnu on Windows 10
https://medium.com/@m_mcclarty/setting-up-solidity-on-windows-10-993a1d2c615c 
This is pretty cool.  I didn't even know Windows 10 has a built in bash shell.  I'm not even a big ubuntu guy, but this one is appealing.  Much easier than setting up a VPS.  The nice thing about running things in Ubuntu is that there seems to be no shortage of resources.  As I get this figured out, I'll add more tips.

