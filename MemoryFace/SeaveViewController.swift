//
//  SeaveViewController.swift
//  MemoryFaceTests
//
//  Created by 福井　愛梨 on 2019/11/09.
//  Copyright © 2019 福井　愛梨. All rights reserved.
//

import UIKit

class SeaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seave(sender: AnyObject) {
        //    ユーザーデフォルトに保存する
        @IBAction func memorizeText(_ sender: Any) {
            let writtenText = tab01.text! as String
            let defaults = UserDefaults.standard
            defaults.set(writtenText, forKey: "tab01Text")
            view.endEditing(true)
        }
        
        //保存したテキストをタブ設定のTextfieldに表示する
        @IBAction func readText(_ sender: Any){
            let defaults = UserDefaults.standard
            let value = defaults.string(forKey: "tab01Text")
            tab01.text = value
            print(name.text)
        }
        @objc func saveImage(_ sender: UITapGestureRecognizer) {
            
            //タップしたUIImageViewを取得
            let targetImageView = sender.view! as! UIImageView
            // その中の UIImage を取得
            let targetImage = targetImageView.image!
            //保存するか否かのアラート
            let alertController = UIAlertController(title: "保存", message: "この画像を保存しますか？", preferredStyle: .alert)
            //OK
            let okAction = UIAlertAction(title: "OK", style: .default) { (ok) in
                //ここでフォトライブラリに画像を保存
                UIImageWriteToSavedPhotosAlbum(targetImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
            }
            //CANCEL
            let cancelAction = UIAlertAction(title: "CANCEL", style: .default) { (cancel) in
                alertController.dismiss(animated: true, completion: nil)
            }
    }
    
    @IBAction func name(sender: AnyObject) {
    }
    
    @IBAction func camera(sender: AnyObject) {
        //カメラが使えるかどうかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        
            
        //カメラを起動
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
        //カメラ、カメラロールを使った時に
        }else{
            //カメラが出ない場合カメラが出ない場合はエラーがコンソールに出る
            print("error")
        }
    }
    
    @IBAction func album(sender: AnyObject) {
        
    }
}
}
