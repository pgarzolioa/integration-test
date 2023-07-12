import * from bat::BDD
import * from bat::Assertions

// Install BAT and run this test file , see more: https://docs.mulesoft.com/api-functional-monitoring/bat-execute-task
// run the command from this folder bat OR bat ./checkin-test-suite.dwl
---
describe `Happy Path CheckIn` in [
  PUT `https://check-in-api-sandbox-eay24i.5sc6y6-1.usa-e2.cloudhub.io/api/tickets/PNR123/checkin` with {
      headers: {
        "Content-Type" : "application/json"
      }
      , body: {
        "lastName": "Newton",
        "numBags": 3
      }
    } assert [
      $.response.status mustEqual 200,
      $.response.body.paymentID mustEqual "PAY-1AKD7482FAB9STATKO"
    ] execute [
      log($.response) // <--- Then we’ll log the response
    ]
]
