// db.runCommand("ismaster")
// returns be like this.
// {
//      "ismaster" : false,
//      "secondary" : true,
//      "hosts" : [
//              "ny1.acme.com",
//              "ny2.acme.com",
//              "sf1.acme.com"
//      ],
//      "passives" : [
//           "ny3.acme.com",
//           "sf3.acme.com"
//      ],
//      "arbiters" : [
//          "sf2.acme.com",
//      ]
//      "primary" : "ny2.acme.com",
//      "ok" : true
// }

// you can get primary db server name like this
// rs.isMaster().primary