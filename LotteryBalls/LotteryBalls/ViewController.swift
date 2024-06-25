//
//  ViewController.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSelectedLottery: PaddedTextField!
    @IBOutlet weak var dropDownView: UIView!

    let dropDownTableView = UITableView()
    var isDropDownVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDownTableView.isHidden = true
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        dropDownTableView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.addSubview(dropDownTableView)

        NSLayoutConstraint.activate([
            dropDownTableView.topAnchor.constraint(equalTo: dropDownView.topAnchor),
            dropDownTableView.leftAnchor.constraint(equalTo: dropDownView.leftAnchor),
            dropDownTableView.rightAnchor.constraint(equalTo: dropDownView.rightAnchor),
            dropDownTableView.bottomAnchor.constraint(equalTo: dropDownView.bottomAnchor),
        ])

    }

    @IBAction func onClickDropDown(_ sender: UIButton) {
        isDropDownVisible.toggle()
        dropDownTableView.isHidden = !isDropDownVisible
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArraysData.lotteries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = ArraysData.lotteries[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = ArraysData.lotteries[indexPath.row]
        txtSelectedLottery.text = selectedItem
        dropDownTableView.isHidden = true
        isDropDownVisible = false
        MyStrings.selectedLottery = selectedItem
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let selectedLotteryVC = storyboard.instantiateViewController(withIdentifier: "SelectedLotteryVC") as? SelectedLotteryVC {
            self.navigationController?.pushViewController(selectedLotteryVC, animated: true)
        }
    }
}
