create tablespace PurchaseOrder
  datafile '/PurchaseOrder/purchaseorder.dbf'
  size 500m reuse
  autoextend on next 1024k
  maxsize unlimited;

CREATE USER teamfos IDENTIFIED BY teamfos1234 default tablespace PurchaseOrder;

GRANT ALL PRIVILEGES TO teamfos;