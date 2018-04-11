import sys
import pygame as pg
from pygame.locals import *
import numpy as np
import threading
import socket
import time

import random
from math import radians
from math import sin,cos,tan,sqrt,pi,atan
import hashlib
import threading
import web3
from solc import compile_source


s=[]
f=open('Factory.sol','r')

for l in f:
	s.append(l)
source_code="".join(s)
f.close()
compile_sol = compile_source(source_code)
print(list((compile_sol).keys()))


w3 = web3.Web3(web3.HTTPProvider('http://localhost:8545'))
accounts=w3.eth.accounts

Factory = w3.eth.contract(
    abi = compile_sol['<stdin>:Factory']['abi'],
    bytecode = compile_sol['<stdin>:Factory']['bin'])
accounts=w3.eth.accounts
#binruntime=compile_sol['<stdin>:Factory']['bin-runtime']

App = w3.eth.contract(
    abi = compile_sol['<stdin>:App']['abi'],
    bytecode = compile_sol['<stdin>:App']['bin'])
#binruntime=compile_sol['<stdin>:App']['bin-runtime']


trans_hash = Factory.deploy(transaction={'from':accounts[0]})
txn_receipt = w3.eth.getTransactionReceipt(trans_hash)
FA = txn_receipt['contractAddress']

Factory.transact({'to':FA,'from':accounts[0]}).deployNewContract()
AA=Factory.call({'to':FA,'from':accounts[0]}).getContractAddress()
print(AA)
print(App.call({'to':AA,'from':accounts[0]}).getOwner())
print(accounts[0])
print(App.call({'to':AA,'from':accounts[0]}).getCreator())
print(FA)

sdsd










