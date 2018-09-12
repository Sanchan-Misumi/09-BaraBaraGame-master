//
//  RankingViewController.swift
//  BaraBaraGame
//
//  Created by Takuto Nakamura on 2017/04/21.
//  Copyright © 2017年 Kyome. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {

	@IBOutlet weak var ranking1: UILabel!
	@IBOutlet weak var ranking2: UILabel!
	@IBOutlet weak var ranking3: UILabel!
	let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
		ranking1.text = String(defaults.integer(forKey: "score1"))
		ranking2.text = String(defaults.integer(forKey: "score2"))
		ranking3.text = String(defaults.integer(forKey: "score3"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

	@IBAction func toTop(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}

}
