//
//  GameViewController.swift
//  BaraBaraGame
//
//  Created by Takuto Nakamura on 2017/04/21.
//  Copyright © 2017年 Kyome. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	@IBOutlet weak var img1: UIImageView!
	@IBOutlet weak var img2: UIImageView!
	@IBOutlet weak var img3: UIImageView!
	@IBOutlet weak var result: UILabel!

	var timer: Timer!
	var score: Int = 1000
	let defaults = UserDefaults.standard
	let width: CGFloat = UIScreen.main.bounds.size.width
	var positionX: [CGFloat] = [0.0, 0.0, 0.0]
	var dx: [CGFloat] = [1.0, 0.5, -1.0]

    override func viewDidLoad() {
        super.viewDidLoad()
		positionX = [width / 2, width / 2, width / 2]
		self.start()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

	}

	func start() {
		result.isHidden = true
		timer = Timer.scheduledTimer(timeInterval: 0.004,
		                             target: self,
		                             selector: #selector(self.up),
		                             userInfo: nil,
		                             repeats: true)
		timer.fire()
	}

	func up() {
		for i in 0 ..< 3 {
			if positionX[i] < 0 || positionX[i] > width {
				dx[i] = -dx[i]
			}
			positionX[i] += dx[i]
		}
		img1.center.x = positionX[0]
		img2.center.x = positionX[1]
		img3.center.x = positionX[2]
	}

	@IBAction func stop(_ sender: Any) {
		if timer.isValid == true {
			timer.invalidate()
		}
        
		for i in 0 ..< 3 {
			score -= 2 * abs(Int(width / 2 - positionX[i]))
		}
        
		result.text = "Score : " + String(score)
		result.isHidden = false

		let highScore1: Int = defaults.integer(forKey: "score1")
		let highScore2: Int = defaults.integer(forKey: "score2")
		let highScore3: Int = defaults.integer(forKey: "score3")
		if score > highScore1 {
			defaults.set(score, forKey: "score1")
			defaults.set(highScore1, forKey: "score2")
			defaults.set(highScore3, forKey: "score3")
		} else if score > highScore2 {
			defaults.set(score, forKey: "score2")
			defaults.set(highScore2, forKey: "score3")
		} else if score > highScore3 {
			defaults.set(score, forKey: "score3")
		}
		defaults.synchronize()
	}
    
    
	@IBAction func toTop(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
    
    

	@IBAction func retry(_ sender: Any) {
		score = 1000
		positionX = [width / 2, width / 2, width / 2]
		if timer.isValid == false {
			self.start()
		}
	}

}
