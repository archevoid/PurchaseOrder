--------------------------------------------------------
--  파일이 생성됨 - 토요일-8월-12-2023
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SCHEDULED_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCHEDULED_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PARTCODE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PARTCODE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTMENT"
   (	"DEPT_NUM" NUMBER(2,0),
	"DEPT_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "EMPLOYEE"
   (	"EMPL_NUM" NUMBER(6,0),
	"DEPT_NUM" NUMBER(2,0),
	"EMPL_NAME" VARCHAR2(50),
	"EMPL_EMAIL" VARCHAR2(50),
	"EMPL_PASSWORD" VARCHAR2(60),
	"AUTHORITY" VARCHAR2(10)
   ) ;
--------------------------------------------------------
--  DDL for Table INSPECTION
--------------------------------------------------------

  CREATE TABLE "INSPECTION"
   (	"ORDER_NUM" NUMBER(8,0),
	"INSPECTION_NUM" NUMBER(2,0),
	"INSPECTION_DATE" DATE,
	"INSPECTION_QUANTITY" NUMBER(8,0),
	"SAMPLE_QUANTITY" NUMBER(8,0)
   ) ;
--------------------------------------------------------
--  DDL for Table INSPECTION_RESULT
--------------------------------------------------------

  CREATE TABLE "INSPECTION_RESULT"
   (	"ORDER_NUM" NUMBER(8,0),
	"INSPECTION_NUM" NUMBER(2,0),
	"INSPECTION_DEFECT" NUMBER(8,0),
	"CLOSE" NUMBER(1,0),
	"PROGRESS" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table PURCHASE_ORDER
--------------------------------------------------------

  CREATE TABLE "PURCHASE_ORDER"
   (	"ORDER_NUM" NUMBER(8,0),
	"scheduled_date" DATE,
	"ORDER_QUANTITY" NUMBER(8,0),
	"EMPL_NUM" NUMBER(6,0),
	"SUPPORT_NUM" NUMBER(8,0),
	"CONTRACT_NUM" NUMBER(8,0),
	"SCHEDULED_NUM" NUMBER(8,0),
	"EMERGENCY" NUMBER(1,0),
	"PUBLISHED" VARCHAR2(100),
	"ORDER_DATE" DATE,
	"SCHEDULED_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table TBL_COMPANY
--------------------------------------------------------

  CREATE TABLE "TBL_COMPANY"
   (	"CODE" VARCHAR2(255),
	"NAME" VARCHAR2(255),
	"BUSINESS_NUMBER" VARCHAR2(50),
	"TAXCODE" VARCHAR2(50),
	"OWNER" VARCHAR2(255),
	"CONTACT" VARCHAR2(100),
	"ADDRESS" VARCHAR2(500),
	"ACCOUNT" VARCHAR2(100),
	"COMPANY_SIZE" VARCHAR2(50),
	"CATEGORY" VARCHAR2(100),
	"SALES" NUMBER,
	"DEAL_TYPE" VARCHAR2(50),
	"DOMESTIC_FOREIGN" VARCHAR2(50),
	"CURRENCY" VARCHAR2(50),
	"START_DATE" DATE,
	"END_DATE" VARCHAR2(50),
	"INVOICE_ISSUE" VARCHAR2(50),
	"COMEMPLOYEE" VARCHAR2(255),
	"COMEMAIL" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table TBL_CONTRACT
--------------------------------------------------------

  CREATE TABLE "TBL_CONTRACT"
   (	"CONTRACTNO" NUMBER,
	"PARTSSUPPLY" NUMBER,
	"TRANSFERCONDITIONS" VARCHAR2(500),
	"UNITPRICE" NUMBER,
	"PARTCODE" NUMBER,
	"CODE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table TBL_PART
--------------------------------------------------------

  CREATE TABLE "TBL_PART"
   (	"PARTCODE" NUMBER(*,0),
	"PARTNAME" VARCHAR2(255),
	"NICKNAME" VARCHAR2(100),
	"LIBRARY" VARCHAR2(50),
	"REMARK" VARCHAR2(500),
	"COMMON" VARCHAR2(100),
	"DRW_NO" VARCHAR2(50),
	"DRW_IMG" VARCHAR2(200)
   ) ;
--------------------------------------------------------
--  DDL for Table TBL_SUPPORT
--------------------------------------------------------

  CREATE TABLE "TBL_SUPPORT"
   (	"SUPPORTNO" NUMBER,
	"PARTCODE" VARCHAR2(255),
	"REQUIREMENT" VARCHAR2(500),
	"MATERIALPROCESS" VARCHAR2(255),
	"DAYSCHEDULE" NUMBER(8,0),
	"DELIVERYDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table WAREHOUSING
--------------------------------------------------------

  CREATE TABLE "WAREHOUSING"
   (	"WARE_NUM" NUMBER,
	"WARE_DATE" DATE,
	"WARE_QUANTITY" NUMBER,
	"IS_RETURN" VARCHAR2(1),
	"ORDER_NUM" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index DEPARTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPARTMENT_PK" ON "DEPARTMENT" ("DEPT_NUM")
  ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMPLOYEE_PK" ON "EMPLOYEE" ("EMPL_NUM")
  ;
--------------------------------------------------------
--  DDL for Index INSPECTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INSPECTION_PK" ON "INSPECTION" ("ORDER_NUM", "INSPECTION_NUM")
  ;
--------------------------------------------------------
--  DDL for Index INSPECTION_RESULT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INSPECTION_RESULT_PK" ON "INSPECTION_RESULT" ("ORDER_NUM", "INSPECTION_NUM")
  ;
--------------------------------------------------------
--  DDL for Index PURCHASE_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PURCHASE_ORDER_PK" ON "PURCHASE_ORDER" ("ORDER_NUM")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008314
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008314" ON "TBL_PART" ("PARTCODE")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008319
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008319" ON "TBL_SUPPORT" ("SUPPORTNO")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008320
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008320" ON "TBL_CONTRACT" ("CONTRACTNO")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008321
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008321" ON "WAREHOUSING" ("WARE_NUM")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008322
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008322" ON "TBL_COMPANY" ("CODE")
  ;
--------------------------------------------------------
--  DDL for Index DEPARTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPARTMENT_PK" ON "DEPARTMENT" ("DEPT_NUM")
  ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMPLOYEE_PK" ON "EMPLOYEE" ("EMPL_NUM")
  ;
--------------------------------------------------------
--  DDL for Index INSPECTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INSPECTION_PK" ON "INSPECTION" ("ORDER_NUM", "INSPECTION_NUM")
  ;
--------------------------------------------------------
--  DDL for Index INSPECTION_RESULT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INSPECTION_RESULT_PK" ON "INSPECTION_RESULT" ("ORDER_NUM", "INSPECTION_NUM")
  ;
--------------------------------------------------------
--  DDL for Index PURCHASE_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PURCHASE_ORDER_PK" ON "PURCHASE_ORDER" ("ORDER_NUM")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008322
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008322" ON "TBL_COMPANY" ("CODE")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008320
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008320" ON "TBL_CONTRACT" ("CONTRACTNO")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008314
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008314" ON "TBL_PART" ("PARTCODE")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008319
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008319" ON "TBL_SUPPORT" ("SUPPORTNO")
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008321
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008321" ON "WAREHOUSING" ("WARE_NUM")
  ;
--------------------------------------------------------
--  DDL for Trigger PURCHASE_ORDER_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PURCHASE_ORDER_TRG"
BEFORE INSERT ON PURCHASE_ORDER
FOR EACH ROW
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "PURCHASE_ORDER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PURCHASE_ORDER_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PURCHASE_ORDER_TRG"
BEFORE INSERT ON PURCHASE_ORDER
FOR EACH ROW
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "PURCHASE_ORDER_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" MODIFY ("DEPT_NUM" NOT NULL ENABLE);
  ALTER TABLE "DEPARTMENT" MODIFY ("DEPT_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPARTMENT_PK" PRIMARY KEY ("DEPT_NUM")
  USING INDEX "DEPARTMENT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" MODIFY ("AUTHORITY" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("EMPL_NUM" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("DEPT_NUM" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("EMPL_NAME" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("EMPL_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("EMPL_PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_PK" PRIMARY KEY ("EMPL_NUM")
  USING INDEX "EMPLOYEE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INSPECTION
--------------------------------------------------------

  ALTER TABLE "INSPECTION" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION" MODIFY ("INSPECTION_NUM" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION" MODIFY ("INSPECTION_DATE" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION" MODIFY ("INSPECTION_QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION" MODIFY ("SAMPLE_QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION" ADD CONSTRAINT "INSPECTION_PK" PRIMARY KEY ("ORDER_NUM", "INSPECTION_NUM")
  USING INDEX "INSPECTION_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INSPECTION_RESULT
--------------------------------------------------------

  ALTER TABLE "INSPECTION_RESULT" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION_RESULT" MODIFY ("INSPECTION_NUM" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION_RESULT" MODIFY ("INSPECTION_DEFECT" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION_RESULT" ADD CONSTRAINT "INSPECTION_RESULT_PK" PRIMARY KEY ("ORDER_NUM", "INSPECTION_NUM")
  USING INDEX "INSPECTION_RESULT_PK"  ENABLE;
  ALTER TABLE "INSPECTION_RESULT" MODIFY ("CLOSE" NOT NULL ENABLE);
  ALTER TABLE "INSPECTION_RESULT" MODIFY ("PROGRESS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PURCHASE_ORDER
--------------------------------------------------------

  ALTER TABLE "PURCHASE_ORDER" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("scheduled_date" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("ORDER_QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("EMPL_NUM" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("SUPPORT_NUM" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("CONTRACT_NUM" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" ADD CONSTRAINT "PURCHASE_ORDER_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX  ENABLE;
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("SCHEDULED_NUM" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("PUBLISHED" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("EMERGENCY" NOT NULL ENABLE);
  ALTER TABLE "PURCHASE_ORDER" MODIFY ("ORDER_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_COMPANY
--------------------------------------------------------

  ALTER TABLE "TBL_COMPANY" ADD PRIMARY KEY ("CODE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_CONTRACT
--------------------------------------------------------

  ALTER TABLE "TBL_CONTRACT" ADD PRIMARY KEY ("CONTRACTNO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_PART
--------------------------------------------------------

  ALTER TABLE "TBL_PART" ADD PRIMARY KEY ("PARTCODE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_SUPPORT
--------------------------------------------------------

  ALTER TABLE "TBL_SUPPORT" ADD PRIMARY KEY ("SUPPORTNO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table WAREHOUSING
--------------------------------------------------------

  ALTER TABLE "WAREHOUSING" ADD PRIMARY KEY ("WARE_NUM")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_FK1" FOREIGN KEY ("DEPT_NUM")
	  REFERENCES "DEPARTMENT" ("DEPT_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INSPECTION
--------------------------------------------------------

  ALTER TABLE "INSPECTION" ADD CONSTRAINT "INSPECTION_FK1" FOREIGN KEY ("ORDER_NUM")
	  REFERENCES "PURCHASE_ORDER" ("ORDER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INSPECTION_RESULT
--------------------------------------------------------

  ALTER TABLE "INSPECTION_RESULT" ADD CONSTRAINT "INSPECTION_RESULT_FK1" FOREIGN KEY ("ORDER_NUM", "INSPECTION_NUM")
	  REFERENCES "INSPECTION" ("ORDER_NUM", "INSPECTION_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PURCHASE_ORDER
--------------------------------------------------------

  ALTER TABLE "PURCHASE_ORDER" ADD CONSTRAINT "PURCHASE_ORDER_FK1" FOREIGN KEY ("EMPL_NUM")
	  REFERENCES "EMPLOYEE" ("EMPL_NUM") ENABLE;
  ALTER TABLE "PURCHASE_ORDER" ADD CONSTRAINT "PURCHASE_ORDER_FK2" FOREIGN KEY ("CONTRACT_NUM")
	  REFERENCES "TBL_CONTRACT" ("CONTRACTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CONTRACT
--------------------------------------------------------

  ALTER TABLE "TBL_CONTRACT" ADD CONSTRAINT "TBL_CONTRACT_FK1" FOREIGN KEY ("PARTCODE")
	  REFERENCES "TBL_PART" ("PARTCODE") ENABLE;
