# CoffeeRight-RestAPI

<h1 align="center">Coffee Right</h1>

Coffee Right merupakan aplikasi android pemesanan minuman dan makanan yang tersedia pada toko Coffee Right yang dibuat secara kelompok.
API Coffee Right ini dibuat dengan menggunakan Express.js untuk menangani backend dari request client ke server. 

[More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.14.15.0-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name #nama_database, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:4000/)
8. You can see all the end point [here](#end-point)

## Set up .env file

Open .env file on your favorite code editor, and copy paste this code below :

```
DB_HOST= YOUR_DB_HOST
DB_USER= YOUR_DB_USER
DB_PASSWORD= YOUR_DB_PASSWORD
DB_DATABASE= YOUR_DATABASE

PORT=YUR_PORT

JWT_KEY =YOUR_JWT_KEY
```

# Link Postman : 
https://documenter.getpostman.com/view/13426001/TW6tLVfW


<!-- ## End-Point

 ```
1. Account

    - Registrasi Admin / Customer [POST]
      http://184.72.105.243:3000/account/register

    - Login Account [POST]
      http://184.72.105.243:3000/account/login

    - Check Email Account [POST]
      http://184.72.105.243:3000/account/email/check/

    - Check Password Account [POST]
      http://184.72.105.243:3000/account/password/check/{id}

    - Detail Account [GET]
      http://184.72.105.243:3000/account/detail/{id}

    - Update Account Profile [PUT]
      http://184.72.105.243:3000/account/update/{id}

    - Update Account Password [PUT]
      http://184.72.105.243:3000/account/update/password/{id}

    - Delete Account [DEL]
      http://184.72.105.243:3000/account/delete/{id}  

2. Customer
    - List Customer [GET]
      http://184.72.105.243:3000/customer

    - List Customer ById [GET]
      http://184.72.105.243:3000/customer/detail/{id}

    - Update Profile Customer [PUT]
      http://184.72.105.243:3000/customer/{id}

3. Admin
    - List Admin [GET]
      http://184.72.105.243:3000/admin

    - List Admin ById [GET]
      http://184.72.105.243:3000/admin/detail/{id}

    - Update Profile Admin [PUT]
      http://184.72.105.243:3000/admin/{id}

4. Product
    - List All Product [GET]
      http://184.72.105.243:3000/product/getAllProduct
    
    - List All Product Filter (filter / limit / page) [GET]
      http://184.72.105.243:3000/product/getFilterProduct?filter=1&limit=2&page=1

    - List All Product ByPrId [GET]
      http://184.72.105.243:3000/product/getProductByPrId/{id}

    - Add Product [POST]
      http://184.72.105.243:3000/product/addProduct

    - Update Product [PUT]
      http://184.72.105.243:3000/product/updateProductByPrId/{id}

    - Delete Product [DELETE]
      http://184.72.105.243:3000/product/deleteProduct/{id}  

5. Order
    - Add Order [POST]
      http://184.72.105.243:3000/order/addOrder

    - List All Order [GET]
      http://184.72.105.243:3000/order

    - List All Order ById Customer [GET]
      http://184.72.105.243:3000/order/{id}

    - List All Order by Cs id and Status Cart [GET]
      http://184.72.105.243:3000/order/statusCart/{id}

    - List All history order by od id [GET]
      http://184.72.105.243:3000/order/historyOrderByOdId/{id}

    - Update Order ById Order [PUT]
      http://184.72.105.243:3000/order/updateOrder/{id}  
    
    - Update Order ById Order Min [PUT]
      http://184.72.105.243:3000/order/updateOrderMin/{id}  

    - Update od id by csId n Status [PUT]
      http://184.72.105.243:3000/order/updateOdIdByCsId/{id}

    - Update order status by od id [PUT]
      http://184.72.105.243:3000/order/updateOrderStatusByOdId/{id}  

    - Delete Order [DELETE]
      http://184.72.105.243:3000/order/deleteOrder/{id}    

6. Delivery
    - Add Delivery [POST]
      http://184.72.105.243:3000/delivery/create

    - List All Delivery [GET]
      http://184.72.105.243:3000/delivery
    
    - Update Delivery [PUT]
      http://184.72.105.243:3000/delivery/{id}

    - Delete Delivery by cs id [DELETE]
      http://184.72.105.243:3000/delivery/deleteDeliveryByCsId/{id}

7. Order Detail
    - Add Order Detail [POST]
      http://184.72.105.243:3000/orderDetail/create

    - List All Order Detail [GET]
      http://184.72.105.243:3000/orderDetail

    - List All Order Detail By Id [GET]
      http://184.72.105.243:3000/orderDetail/getAllById/{id}

    - List All Order Detail By Cs Id [GET]
      http://184.72.105.243:3000/orderDetail/getAllByCsId/{id}

    - Update Order Detail [PUT]
      http://184.72.105.243:3000/orderDetail/update/{id}

    - Delete Order Detail [DELETE]
      http://184.72.105.243:3000/orderDetail/deleteOrderDetail/{id}

8. Discount
    - Add Discount [POST]
      http://184.72.105.243:3000/discount

    - List All Discount [GET]
      http://184.72.105.243:3000/discount

    - Update Discount [PUT]
      http://184.72.105.243:3000/discount/{id}

    - Delete Discount [DELETE]
      http://184.72.105.243:3000/discount/{id}
``` -->