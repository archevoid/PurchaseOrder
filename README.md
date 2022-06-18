# PurchaseOrder
- 엠아이티능력개발원 팀 프로젝트
  + 구매 발주 시스템 개발
<br>

## 개발 환경
- OS: Windows
- IDE: Eclipse 2020-06 (4.16.0) (STS 3.9.15.RELEASE)
- JDK: Oracle jdk1.8.0_202
- DB: MariaDB 10.6.8
<br>

## DB ERD
![PO_TeamFoS drawio](https://user-images.githubusercontent.com/106382062/174419021-2c7c5d31-3077-48e4-9d55-61b065226f28.png)
<br>

## Coding Style

### Naming
- Class Name: `UpperCamelCase`
  + 단, DAO/DTO 등 두문자어는 대문자 가능
- Method Name: `lowerCamelCase`
- Non-Final Variable: `lowerCamelCase`
- Final Variable: `SCREAMING_SNAKE_CASE`
- Declaration
  + One Declaration in One Line
    * `int x; // Good`
    * `int x, y; // Bad`
  + `Array: Type[] name`
<br>

## Pages
  - **context는 루트(/)컨텍스트로 고정 (컨텍스트 변경시 오류 발생 가능)**
  - 페이지 출처
    + **로그인: https://startbootstrap.com/template/sb-admin**
    + **po디렉토리 모든 페이지: 확인 후 추가 예정**
  - Authory List
    + ROLE_PD
      * 구매 개발 부서의 권한
    + ROLE_PTN
      * 협력 업체의 권한
<br>

  ### /
  설명: 로그인 등 전 사원, 관계자 등을 위한 디렉토리
  - login.jsp
    + 로그인을 위한 페이지
    + 로그인하지 않은 사용자가 /po 경로로 진입했을 때 자동 리다이렉트되는 페이지
    + 접근 권한: PermitAll
    + URL Mapping: /login
<br>

  ### include
  설명: 다른 페이지에 include하기 위한 디렉토리
  - header.jsp
    + html의 헤더
<br>

  - nav.jsp
    + 사이드 navigation 바
<br>

  ### po (Product Order)
  설명: 구매 발주에 관련된 디렉토리
  - dashboard.jsp
    + po의 프론트 페이지
    + 접근 권한: ROLE_PD, ROLE_PTN
    + URL Mapping: /po/dashboard
<br>

  - plan.jsp
    + 계획 확인 페이지
      * 예상 시나리오
        - 입력 상황
          1. 계획번호를 제외한 모든 사항을 입력
          2. 입력 버튼을 클릭
        - 수정, 검수, 발행 상황
          1. 계획번호를 선택
          2. 자동 새로고침 후 DB에서 데이터 가져옴
          3. 버튼 클릭 (입력 상황시, 항목 입력 후)
    + 접근 권한: ROLE_PD
    + URL Mapping: /po/plan
<br>

  - inspection.jsp
    + plan페이지에서 접근
    + 계획 검수 등록 페이지
      * 엑셀 등 계획 사항에 대한 파일을 업로드, 다운로드
      * 업로드, 다운로드 페이지 각자 존재
        - 파라미터로 페이지 제공
    + 접근 권한: ROLE_PD
    + URL Mapping: /po/inspection, ?type=\[upload(default), download]
<br>

  - inputStatusShipment.jsp
    + 출하 준비 상태 작성 페이지
      * 협력회사가 작성하는 페이지
      * 제작 상태, 현재 수량을 제외한 모든 항목이 DB에서 자동 작성
    + 접근 권한: ROLE_PTN
    + URL Mapping: /po/partner
<br>

  - progress.jsp
    + 납기 진도율 확인 페이지
      * 계획을 선택하면 품목 등의 항목을 확인 가능
      * 그래프를 이용해 현재 진행상황 확인 가능
    + 접근 권한: ROLE_PD
    + URL Mapping: /po/progress
<br>

  - printPO.jsp
    + 발주서 프린트 페이지
      * Ctrl + p 등을 이용해 서류 형식으로 프린트하는 페이지
      * plan페이지의 정보를 받아 DB에서 항목을 채움
    + 접근 경로: /po/plan페이지를 통해서만 접근 가능 
    + 접근 권한: ROLE_PD
    + URL Mapping: /po/printpo (소문자)
<br>

  - register.jsp
    + 회원가입을 위한 페이지
    + 접근 권한: PermitAll
    + URL Mapping: /register
<br>

  - password.jsp
    + 비밀번호를 찾기 위한 페이지
      * 이메일을 이용해 비밀번호 재설정
    + 접근 권한: PermitAll
    + URL Mapping: /password

  ### /error
  설명: 에러 상황시 사용되는 디렉토리
  - 404.jsp
    + 404에러페이지
    + URL Mapping: 미정(\[/error/404, /404]
<br>

  - accessError.jsp
    + 접근 오류 페이지
      * 권한이 없는 사용자가 접근시 사용됨
    + URL Mapping: 미정(\[/error/401, /401, /error/accessError, /accessError]

  ### /basic
  설명: 페이지 확인용 디렉토리  
    **삭제 예정**
