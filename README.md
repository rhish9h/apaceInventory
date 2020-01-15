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

1. clone apaceInventory
2. cd to apaceInventory (in console)
    > npm install
    > npm install --save axios bootstrap-vue bootstrap/dist/css/bootstrap.css vue-axios
3. clone apaceInventoryBackend
    -transfer folder 'api' to htdocs in xampp
4. open phpmyadmin (type localhost/phpmyadmin in browser) 
    -create database of name 'apace'
    -import apace(1) in phpmyadmin from folder 'api'
5. cd to apaceInventory
    > npm run dev
6. open xampp controller
    -start Apache
    -start MySQL
