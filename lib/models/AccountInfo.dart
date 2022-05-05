class accountinfo {
  late String accountUser;
  late String accountNum;
  late String accountName;
  late String routingNum;
  late String money;
  late int accountid;

  accountinfo() {
    accountUser = "";
    accountNum = "";
    routingNum = "";
    money = "";
    accountName = "";
    accountid = -1;
  }

  accountname(String name) {
    accountName = name;
  }

  getaccountid(int id) {
    accountid = id;
  }
}
