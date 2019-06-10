//
//  gradess.swift
//  Game
//
//  Created by 金陳廷 on 2019/6/1.
//  Copyright © 2019 notu. All rights reserved.
//

import UIKit

class gradess: UIViewController {
    var names: String?
    var times: String?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        name.text=names
        time.text=times
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
