/*import UIKit
import Firebase


class MatchingAlgorithm: UIViewController {
    var userChildhood : AnyObject
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var refpsy = Firebase(url:"https://boiling-heat-1824.firebaseio.com/users/therapists")

    
    override func viewDidLoad() {
        super.viewDidLoad()
    ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
    error, authData in
    if error != nil {
    print("error")
    } else {
    var refUser = self.ref.childByAppendingPath("users")
            .childByAppendingPath("patients").childByAppendingPath(authData.uid)
 
 var finalList = self.refpsy

//filterbychildhoodvalues
 var userChildhoodPath = refUser.childByAppendingPath("Childhood")
 userChildhoodPath.observeEventType(.Value, withBlock: { snapshot in
             userChildhood = snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
 print(userChildhood)
        }}}}

 var userEthnicityPath = refUser.childByAppendingPath("Ethnicity")
 var userExpertisePath = refUser.childByAppendingPath("Expertise")
 var userGenderPath = refUser.childByAppendingPath("Gender")
 var userLocationPath = refUser.childByAppendingPath("Location")
 var userCostPath = refUser.childByAppendingPath("cost")
 var userDirectiveOath = refUser.childByAppendingPath("directive")


 var finalList = finalList.queryOrderedByChild("Ethnicity").queryEqualToValue(userEthnicity)
 finalList = finalList.queryOrderedByChild("Expertise").queryEqualToValue(userExpertise)
 finalList = finalList.queryOrderedByChild("Gender").queryEqualToValue(userGender)
 finalList = finalList.queryOrderedByChild("Location").queryEqualToValue(userLocation)
 finalList = finalList.queryOrderedByChild("cost").queryEqualToValue(userCost)
 finalList = finalList.queryOrderedByChild("directive").queryEqualToValue(userDirective)
 finalList = finalList.queryOrderedByChild("Childhood").queryEqualToValue(userChildhood)
    finalList.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.key)})
        
        }}}*/
