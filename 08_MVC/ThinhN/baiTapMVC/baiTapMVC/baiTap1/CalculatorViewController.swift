//
//  CalculatorViewController.swift
//  baiTapMVC
//
//  Created by ADMIN on 4/16/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var hienKetQua: UILabel!
    
    private var giaTri: ToanHang = ToanHang()
       private var ketQuaCuoi: Int = 0
       override func viewDidLoad() {
           super.viewDidLoad()
       }
    @IBAction func chooseNumberTouchUpInsine(_ sender: UIButton) {
        hienKetQua.text = String(giaTri.themSo(soDuocThem: Int(sender.tag)))
    }
    @IBAction func chooseOperatorButtonTouchUpInsine(_ sender: UIButton) {
        hienKetQua.text = String(TinhToan.share.nhanPhepTinh)
        switch sender.tag {
        case 0:
            hienKetQua.text = "+"
            TinhToan.share.cacPhepTinh.append("+")
            giaTri.cacSoTrongMang.append(giaTri.soBanDau)
            giaTri.soBanDau = 0
        case 1:
            hienKetQua.text = "-"
            TinhToan.share.cacPhepTinh.append("-")
            giaTri.cacSoTrongMang.append(giaTri.soBanDau)
            giaTri.soBanDau = 0
        case 2:
            hienKetQua.text = "x"
            TinhToan.share.cacPhepTinh.append("x")
            giaTri.cacSoTrongMang.append(giaTri.soBanDau)
            giaTri.soBanDau = 0
        default:
            hienKetQua.text = "/"
            TinhToan.share.cacPhepTinh.append("/")
            giaTri.cacSoTrongMang.append(giaTri.soBanDau)
            giaTri.soBanDau = 0
        }
    }
    @IBAction private func clearButtonTouchUpInsine(_ sender: Any) {
        hienKetQua.text = "0"
        giaTri.cacSoTrongMang = []
        TinhToan.share.cacPhepTinh = []
        giaTri.soBanDau = 0
        ketQuaCuoi = 0
    }
    @IBAction func resultButtonTouchUpInsine(_ sender: Any) {
      guard giaTri.soBanDau != 0 else {
               return
        }
        giaTri.cacSoTrongMang.append(giaTri.soBanDau)
           if giaTri.cacSoTrongMang[0] == 0 {
               TinhToan.share.ketQua = ketQuaCuoi
               TinhToan.share.nhanPhepTinh = TinhToan.share.cacPhepTinh[0]
               ketQuaCuoi = TinhToan.share.phepTinh(giaTriNhapVao: giaTri.cacSoTrongMang[1])
           } else {
               TinhToan.share.ketQua = giaTri.cacSoTrongMang[0]
               for index in 1 ..< giaTri.cacSoTrongMang.count {
                   TinhToan.share.nhanPhepTinh = TinhToan.share.cacPhepTinh[index - 1 ]
                   TinhToan.share.ketQua = TinhToan.share.phepTinh(giaTriNhapVao: giaTri.cacSoTrongMang[index])
               }
               ketQuaCuoi = TinhToan.share.ketQua
           }
           if ketQuaCuoi <= 999999 {
               hienKetQua.text = String(ketQuaCuoi)
           } else {
               hienKetQua.text = "999999"
           }
           giaTri.cacSoTrongMang = []
           TinhToan.share.cacPhepTinh = []
           giaTri.soBanDau = 0
       }
}
