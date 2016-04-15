import UIKit
import Firebase


class MatchingAlgorithm: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var refpsy = Firebase(url:"https://boiling-heat-1824.firebaseio.com/users/therapists")
    var therapists = [[String]]()
    
    
    func findMatches(){
        var finalList = self.refpsy
        let userScore=OldAnswersPatients.sharedInstance.score
        var matching = finalList.queryOrderedByChild("Score").queryEqualToValue("4114111")
                //String(userScore)
                matching.observeEventType(.ChildAdded, withBlock: { snapshot in
                    var tempItems = [String]()
                    
                    for item in snapshot.children.allObjects as! [FDataSnapshot] {
                        let dict = item.value as! (String)
                        tempItems.append(dict)
                    }
                    
                    self.therapists.append(tempItems)
                    
                })

    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
