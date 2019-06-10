//
//  game1.swift
//  Game
//
//  Created by 金陳廷 on 2019/5/9.
//  Copyright © 2019 notu. All rights reserved.
//

import UIKit
import UserNotifications
class game1: UIViewController {
    
    
    var timer: Timer?
    var times = 0
    var win = false
    var ani = ""
    @IBOutlet weak var timelabel: UILabel!
    
    var initialarray2D: [[String]] = [
        ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"],
        ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"],
        ["-1","-1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","10","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","10","0","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","10","10","0","3","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","0","0","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","6","0","0","0","0","7","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","0","0","0","5","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","10","10","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","10","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","2","0","10","0","9","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","3","0","10","0","3","0","0","1","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","4","0","10","0","8","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","-1","-1"],
        ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"], ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"]
    ]
    
    var array2D: [[String]] = [
       ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"], ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"],
        ["-1","-1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","10","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","10","0","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","10","10","0","3","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","0","0","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","6","0","0","0","0","7","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","0","0","0","0","5","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","10","10","10","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","10","0","0","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","2","0","10","0","9","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","3","0","10","0","3","0","0","1","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","4","0","10","0","8","0","0","0","0","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","10","10","10","10","10","10","10","10","0","0","0","0","0","-1","-1"],
        ["-1","-1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","-1","-1"],
       ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"], ["-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1","-1"]
    ]
    
    //0:ground_ 1:baba 2:baba_ 3:is_ 4:You_ 5:flag
    //6:flag_ 7:win_ 8:stop_ 9:wall_ 10:wall
    //11:rock_ 12:rock 13:defeat_
    func push_square(arrays: [[String]])->[(Int,Int)]{
        var movess = [(Int,Int)]()
        for i in 2...15 {
            for j in 2...17 {
                if (arrays[i][j]=="2"||arrays[i][j]=="3"||arrays[i][j]=="9"||arrays[i][j]=="4")||arrays[i][j]=="6"||arrays[i][j]=="8"||arrays[i][j]=="7"{
                    movess.append((i,j))
                }
                
            }
        }
        return movess
        //""
        
    }
    
    func find_you(square:String,arrays:[[String]]) -> (Int,Int){
        
        for i in 2...15 {
            for j in 2...17 {
                if arrays[i][j]==square{
                    return (i,j)
                }
                
            }
        }
        return (2,2)
    }
    
    
    
    
    
    func win_self(selfs : String) -> String{
        if selfs=="6"{
            return "5"
        }
        else if selfs=="9"{
            return "10"
        }
        else if selfs == "2"{
            return "1"
        }
        else {
            return "-2"
        }
    }
    
    func win_square(arrays:[[String]] ) -> String{
        for i in 2...15 {
            for j in 2...17 {
                if arrays[i][j]=="7" && arrays[i-1][j]=="3" && arrays[i-2][j]=="6"  {
                    
                    return arrays[i-2][j]
                    
                }
                else if (arrays[i][j]=="7" && arrays[i][j-1]=="3" && (arrays[i][j-2]=="6" || arrays[i][j-2]=="2" || arrays[i][j-2]=="9")){
                    
                    return arrays[i][j-2]
                }
            }
        }
        return "0"
        
    }
    
    func stop_square( arrays:[[String]] ) ->[(Int,Int)]{
    var stopss=[(Int,Int)]()
        for i in 1...16 {
            for j in 1...18 {
                if(arrays[i][j]=="-1"){
                    stopss.append((i,j))
                }
            }
            
        }
        for i in 2...15 {
            for j in 2...17 {
                if arrays[i][j]=="8" && arrays[i-1][j]=="3"  {
                    
                    if(arrays[i-2][j]=="6"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="5"){
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                        return stopss
                    }
                    else if(arrays[i-2][j]=="2"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="1"){
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                        return stopss
                    }
                    else if(arrays[i-2][j]=="9"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="10"){
                                    
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                    }
                    return stopss
                    
                }
                else if arrays[i][j]=="8" && arrays[i][j-1]=="3" {
                    if(arrays[i][j-2]=="6"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="5"){
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                        return stopss
                    }
                    else if(arrays[i][j-2]=="2"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="1"){
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                        return stopss
                    }
                    else if(arrays[i][j-2]=="9"){
                        for k in 2...15 {
                            for l in 2...17 {
                                if(arrays[k][l]=="10"){
                                    stopss.append((k,l))
                                }
                            }
                            
                        }
                        return stopss
                    }
                    
                }

            }
        }
        
        return stopss
        //"8"
    }
    
    func flag_square(){
        
        //"6"
    }
    func you_square(arrays: [[String]] ) -> String{
        for i in 2...15 {
            for j in 2...17 {
                if (arrays[i][j]=="4" && arrays[i-1][j]=="3" && (arrays[i-2][j]=="6" || arrays[i-2][j]=="2" || arrays[i-2][j]=="9"))  {
                    
                    return arrays[i-2][j]
                    
                }
                else if (arrays[i][j]=="4" && arrays[i][j-1]=="3" && (arrays[i][j-2]=="6" || arrays[i][j-2]=="2" || arrays[i][j-2]=="9")){
                    
                    return arrays[i][j-2]
                }
            }
        }
        return "0"
    }
    
    
    func winanimation(){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 300, y: 300, width: 600, height: 400))
            
            dyImageView.image = UIImage(named:"5")
            
            dyImageView.transform=CGAffineTransform(rotationAngle: 360)
            self.view.addSubview(dyImageView)
        }, completion: nil)
    }
    
    
    @objc func renewTime(){
        times=times+1
        var seconds=""
        if times%60 < 10  && times>60 {
             seconds="0"+String(times%60)
        }
        else{
            seconds=String(times%60)
        }
        if times>3600{
            timelabel.text = String(times/3600)+":"+String((times%3600)/60)+":"+seconds
            
        }
        else if times>60{
            timelabel.text = String(times/60)+":"+seconds
            
        }
        else{
            timelabel.text = seconds
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(renewTime), userInfo: nil, repeats: true)
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                array2D[i][j]=initialarray2D[i][j]
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                self.view.backgroundColor = UIColor(patternImage: UIImage(named: "0")!)
                self.view.addSubview(dyImageView)
                
            }
            
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // 將timer的執行緒停止
        if self.timer != nil {
            self.timer?.invalidate()
        }
        
    }
    @IBAction func resume(_ sender: Any) {
        
        let alert = UIAlertController(title: "通知", message: "是否重來？剛剛的步驟都會消失。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        win = false
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                array2D[i][j]=initialarray2D[i][j]
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                
                self.view.addSubview(dyImageView)
                
            }
            
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        
        if self.timer != nil {
            self.timer?.invalidate()
        }
        
    }
    
    @IBAction func up(_ sender: Any) {
        var stop_ = stop_square(arrays: array2D)
        var users = win_self(selfs:you_square(arrays: array2D))
        var win_ = win_self(selfs:win_square(arrays: array2D))
        var xy = find_you(square: users, arrays: array2D)
        var move_ = push_square(arrays: array2D)
        
        var count = -1
        var push = false
        
        var stopbool=false
        var movenum = -1
       

        array2D[xy.0][xy.1]="0"
        
        
        
        xy.0 -= 1 //往上一步 xy.0 -= 1
        for i in stop_{
            if xy.0 == i.0 && xy.1 == i.1{
                
                stopbool=true
            }
        }
        
        count = -1
        
        for j in move_{
            count += 1
            if xy.0 == j.0 && xy.1 == j.1{
                movenum=count
                move_[count].0 -= 1
                push = true
         
                for i in stop_{
                    if i.0 == move_[count].0 && i.1 == move_[count].1 {
                        move_[count].0 += 1
                        push = false
                        stopbool=true
                    }
                }
            }
        }
        
        if(stopbool==true){
            xy.0 += 1
        }
        

        
    
        
        if(movenum>=0&&push==true){
           var moveto = array2D[move_[movenum].0+1][move_[movenum].1]
           array2D[move_[movenum].0+1][move_[movenum].1]="0"
           array2D[move_[movenum].0][move_[movenum].1] = moveto
        }
        
        if array2D[xy.0][xy.1]==win_{
            win=true
        }
        array2D[xy.0][xy.1]=users
        
        
        
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                
                self.view.addSubview(dyImageView)
                
            }
            
        }
        if win==true{
            let content = UNMutableNotificationContent()
            content.title = "贏了。"
            content.subtitle = "贏了"
            content.body = timelabel.text ?? ""
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
            winanimation()
            if self.timer != nil {
                self.timer?.invalidate()
            }
            let controller = UIAlertController(title: "過關！", message: "請輸入您的名稱", preferredStyle: .alert)
            controller.addTextField { (textField) in
                textField.placeholder = "名稱"
                textField.keyboardType = UIKeyboardType.phonePad
            }
            let okAction = UIAlertAction(title: "確定", style: .default) { (_) in
                let user = controller.textFields?[0].text
                self.ani = user ?? ""
                
                
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func down(_ sender: Any) {
        var stop_ = stop_square(arrays: array2D)
        var users = win_self(selfs:you_square(arrays: array2D))
        var win_ = win_self(selfs:win_square(arrays: array2D))
        var xy = find_you(square: users, arrays: array2D)
        var move_ = push_square(arrays: array2D)
        
        var count = -1
        var push = false
        
        var stopbool=false
        var movenum = -1
        
        
        array2D[xy.0][xy.1]="0"
        
        
        
        xy.0 += 1 //往上一步 xy.0 -= 1
        for i in stop_{
            if xy.0 == i.0 && xy.1 == i.1{
                
                stopbool=true
            }
        }
        
       
        
        for j in move_{
            count += 1
            if xy.0 == j.0 && xy.1 == j.1{
                movenum=count
                move_[count].0 += 1
                push = true
               
                for i in stop_{
                    if i.0 == move_[count].0 && i.1 == move_[count].1 {
                        move_[count].0 -= 1
                        push = false
                        stopbool=true
                    }
                }
            }
        }
        
        if(stopbool==true){
            xy.0 -= 1
        }
        
        
        
        
        
        
        
        if(movenum>=0&&push==true){
            var moveto = array2D[move_[movenum].0-1][move_[movenum].1]
            array2D[move_[movenum].0-1][move_[movenum].1]="0"
            array2D[move_[movenum].0][move_[movenum].1] = moveto
        }
        
        
        if array2D[xy.0][xy.1]==win_{
            win=true
        }
        
        
        array2D[xy.0][xy.1]=users
        
        
        
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                
                self.view.addSubview(dyImageView)
                
            }
            
        }
        if win==true{
            let content = UNMutableNotificationContent()
            content.title = "贏了。"
            content.subtitle = "贏了"
            content.body = timelabel.text ?? ""
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            winanimation()
            if self.timer != nil {
                self.timer?.invalidate()
            }
            let controller = UIAlertController(title: "過關！", message: "請輸入您的名稱", preferredStyle: .alert)
            controller.addTextField { (textField) in
                textField.placeholder = "名稱"
                textField.keyboardType = UIKeyboardType.phonePad
            }
            let okAction = UIAlertAction(title: "確定", style: .default) { (_) in
                let user = controller.textFields?[0].text
                  self.ani = user ?? ""
                
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func right(_ sender: Any) {
        
        var stop_ = stop_square(arrays: array2D)
        var users = win_self(selfs:you_square(arrays: array2D))
        var win_ = win_self(selfs:win_square(arrays: array2D))
        var xy = find_you(square: users, arrays: array2D)
        var move_ = push_square(arrays: array2D)
        
        var count = -1
        var push = false
        
        var stopbool=false
        var movenum = -1
        
        
        array2D[xy.0][xy.1]="0"
        
        
        
        xy.1 += 1 //往右一步 xy.0 -= 1
        for i in stop_{
            if xy.0 == i.0 && xy.1 == i.1{
                
                stopbool=true
            }
        }
        
    
        
        for j in move_{
            count += 1
            if xy.0 == j.0 && xy.1 == j.1{
                movenum=count
                move_[count].1 += 1
                push = true
                
                for i in stop_{
                    if i.0 == move_[count].0 && i.1 == move_[count].1 {
                        move_[count].1 -= 1
                        push = false
                        stopbool=true
                    }
                }
            }
        }
        
        if(stopbool==true){
            xy.1 -= 1
        }
        
        
        
        
       
        if(movenum>=0&&push==true){
            var moveto = array2D[move_[movenum].0][move_[movenum].1-1]
            array2D[move_[movenum].0][move_[movenum].1-1]="0"
            array2D[move_[movenum].0][move_[movenum].1] = moveto
        }
        print(array2D[xy.0][xy.1])
        if array2D[xy.0][xy.1]==win_{
            win=true
        }
        
       array2D[xy.0][xy.1]=users
       
        
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                
                self.view.addSubview(dyImageView)
                
            }
            
        }
        if win==true{
            let content = UNMutableNotificationContent()
            content.title = "贏了。"
            content.subtitle = "贏了"
            content.body = timelabel.text ?? ""
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            winanimation()
            if self.timer != nil {
                self.timer?.invalidate()
            }
            let controller = UIAlertController(title: "過關！", message: "請輸入您的名稱", preferredStyle: .alert)
            controller.addTextField { (textField) in
                textField.placeholder = "名稱"
                textField.keyboardType = UIKeyboardType.phonePad
            }
            let okAction = UIAlertAction(title: "確定", style: .default) { (_) in
                let user = controller.textFields?[0].text
                 self.ani = user ?? ""
                
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func left(_ sender: Any) {
        var stop_ = stop_square(arrays: array2D)
        var users = win_self(selfs:you_square(arrays: array2D))
        var win_ = win_self(selfs:win_square(arrays: array2D))
        var xy = find_you(square: users, arrays: array2D)
        var move_ = push_square(arrays: array2D)
        
        var count = -1
        var push = false
        
        var stopbool=false
        var movenum = -1
        
        
        array2D[xy.0][xy.1]="0"
        
        
        
        xy.1 -= 1 //往左一步 xy.1 -= 1
        
        for i in stop_{
            if xy.0 == i.0 && xy.1 == i.1{
                
                stopbool=true
            }
        }
        
        
        for j in move_{
            count += 1
            if xy.0 == j.0 && xy.1 == j.1{
                movenum=count
                
                move_[count].1 -= 1
                
                push = true
                
                
                for i in stop_{
                    if i.0 == move_[count].0 && i.1 == move_[count].1 {
                        move_[count].1 += 1
                        
                        push = false
                        stopbool=true
                    }
                }
            }
        }
        
        
        if(stopbool==true){
            
            xy.1 += 1
        }
        
      
        
     
        
        
     
       
        
        if(movenum>=0&&push==true){
            var moveto = array2D[move_[movenum].0][move_[movenum].1+1]
            array2D[move_[movenum].0][move_[movenum].1+1]="0"
            array2D[move_[movenum].0][move_[movenum].1] = moveto
        }
        
        
         array2D[xy.0][xy.1]=users
         if array2D[xy.0][xy.1]==win_{
            win=true
         }
        
        
        for i in 2...15 {
            for j in 2...17 {
                let dyImageView: UIImageView = UIImageView(frame:CGRect(x: 0+64*(j-2), y: 70+64*(i-2), width: 64, height: 64))
                
                let dyImage = UIImage(named:array2D[i][j])
                
                dyImageView.image = dyImage
                
                self.view.addSubview(dyImageView)
                
            }
            
        }
        if win==true{
            let content = UNMutableNotificationContent()
            content.title = "贏了。"
            content.subtitle = "贏了"
            content.body = timelabel.text ?? ""
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            winanimation()
            if self.timer != nil {
                self.timer?.invalidate()
            }
            let controller = UIAlertController(title: "過關！", message: "請輸入您的名稱", preferredStyle: .alert)
            controller.addTextField { (textField) in
                textField.placeholder = "名稱"
                textField.keyboardType = UIKeyboardType.phonePad
            }
            let okAction = UIAlertAction(title: "確定", style: .default) { (_) in
                let user = controller.textFields?[0].text
                
                self.ani = user ?? ""
                
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! gradess
        controller.times = timelabel.text
        controller.names = self.ani
       
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
