import UIKit
import Firebase

class MatchingAlgorithm: UIViewController {
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

 
 var userChildhood = refUser.childByAppendingPath("Childhood")
 var userEthnicity = refUser.childByAppendingPath("Ethnicity")
 var userExpertise = refUser.childByAppendingPath("Expertise")
 var userGender = refUser.childByAppendingPath("Gender")
 var userLocation = refUser.childByAppendingPath("Location")
 var userCost = refUser.childByAppendingPath("cost")
 var userDirective = refUser.childByAppendingPath("directive")


 var finalList = self.refpsy.queryOrderedByChild("Ethnicity").queryEqualToValue(userEthnicity)
 finalList = finalList.queryOrderedByChild("Expertise").queryEqualToValue(userExpertise)
 finalList = finalList.queryOrderedByChild("Gender").queryEqualToValue(userGender)
 finalList = finalList.queryOrderedByChild("Location").queryEqualToValue(userLocation)
 finalList = finalList.queryOrderedByChild("cost").queryEqualToValue(userCost)
 finalList = finalList.queryOrderedByChild("directive").queryEqualToValue(userDirective)
 finalList = finalList.queryOrderedByChild("Childhood").queryEqualToValue(userChildhood)
    finalList.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.key)})
        
        }}}}
