# apaceInventory

## Mini erp system to manage the inventory of apace.

The system consists of 3 modules:
- Masters
- Orders
- Materials
    
Masters- contains all the masters tables, raw material stock and logs
Orders- contains display of orders and 3 sub-modules
1. issue material
2. add order
3. order details
Materials- contains issue of material without selecting a particular order

## Installation intructions:

Prerequisites: 
1. node js
2. xampp
3. git
(make sure to give all permissions - private and public)

Steps:
1. clone apaceInventory, extract files  
2. cd to apaceInventory-master/apaceInventory-master/apaceInventory (in console)
    > npm install  
    > npm audit fix  
    > npm install --save axios bootstrap-vue vue-axios
3. clone apaceInventoryBackend from github.com/rhish9h/apaceInventoryBackend, extract files  
    -transfer folder 'apaceInventoryBackend-master' from apaceInventoryBackend-master to htdocs in C:/xampp  
    -rename this folder 'apaceInventoryBackend-master' to 'api'
4. open phpmyadmin (type localhost/phpmyadmin in browser)  
    -create database of name 'apace'  
    -import apace in phpmyadmin from folder 'api'
5. cd to apaceInventory-master/apaceInventory-master/apaceInventory
    > npm run dev
6. open xampp controller  
-start Apache  
-start MySQL

## Server configuration

Set up for devices on same network to connect to the server  
  
1. (on host computer) open powershell
> ipconfig
Get IPv4 address of wireless lan adapter WiFi  
eg 192.168.0.103
2. (on host computer) cd to apaceInventory-master/apaceInventory-master/apaceInventory/src/router  
replace localhost with the ip of the host in index.js (run this command), change ip if needed (in the following command)
> (Get-Content index.js).replace('localhost', '192.168.0.103') | Set-Content index.js

## Batch file for running apace server

open notepad, paste following code in it, save it with .bat extension (all files)  
eg. apace_server.bat (choose all files options)
> note - the path after cd should be the path of your apaceInventory folder on your machine
```
cd C:\Users\apace\Downloads\apaceInventory-master\apaceInventory-master\apaceInventory  
npm run dev
```
after saving, double click on icon to run the server
