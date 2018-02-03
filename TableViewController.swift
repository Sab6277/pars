import UIKit
struct pars: Decodable {
    var user: Data!
}


struct Data: Decodable {
    var name: String
    var lastName: String
    var email: String
    var product : String
}

var tableViewData = [String]()
var indexes = [String]()

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://localhost:8800/document.json"
        guard let url = URL (string: urlString ) else {
            let numbersForIndexes = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21"
            indexes = [numbersForIndexes]
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            guard error == nil else {
                return
            }
            
            do{
                let parsing = try JSONDecoder().decode (pars.self, from: data)
                print(parsing)
            }catch let error{
                print(error)
            }
            
            }.resume()
    }
}
