import UIKit
import Firebase


class MatchingAlgorithm: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var refpsy = Firebase(url:"https://boiling-heat-1824.firebaseio.com/users/therapists")
    
    
    func findMatches(){
        var temp = [[String]]()
        var finalList = self.refpsy
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                let userScore=OldAnswersPatients.sharedInstance.score
                
                var matching = finalList.queryOrderedByChild("Score").queryEqualToValue(String(userScore))
                
                matching.observeEventType(.ChildAdded, withBlock: { snapshot in
                    var tempItems = [String]()
                    
                    for item in snapshot.children.allObjects as! [FDataSnapshot] {
                        let dict = item.value as! (String)
                        tempItems.append(dict)
                    }
                    
                    temp.append(tempItems)
                    print(snapshot)
                    print(self.temp)
                    
                })}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    



        }
