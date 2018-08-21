# irctc_unix_based_application

What if IRCTC ticket booking system serve you with Black Screen ?

with above the idea the code is written in UNIX script.

### Pre-Requisites:
#### Create login table : 
```
SQL> desc IRCTC_LOGIN_DETAILS;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 SR_NO                                                          NUMBER(4)
 USER_ID                                               NOT NULL VARCHAR2(8)
 PASSWORD                                                       VARCHAR2(8)
 FIRST_NAME                                                     VARCHAR2(20)
 LAST_NAME                                                      VARCHAR2(20)
 GENDER                                                         VARCHAR2(2)
 MOB_NUMBER                                                     NUMBER(12)
 LOCALITY                                                       VARCHAR2(15)
```

And insert the your login details in table.

### THIS CODE HAS LOT OF SCOPE FOR BIG IMPROVEMENT AT DATABASE SIDE.

Trigger script for ./www.irctc.co.in.sh 
