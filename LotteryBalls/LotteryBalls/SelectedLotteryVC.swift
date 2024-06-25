//
//  SelectedLotteryVC.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

class SelectedLotteryVC: UIViewController {

    var ballcount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        ArraysData.selectedBalls[MyStrings.selectedLottery] = ballcount
        navigationController?.popViewController(animated: true)
    }

}

extension SelectedLotteryVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectedLotteryBallsCell", for: indexPath) as! SelectedLotteryBallsCell
        
        
        return cell

    }
    
}


class SelectedLotteryBallsCell: UITableViewCell {
    
    @IBOutlet weak var vwBalls: UIView!
    

}
