//
//  DummyData.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import RealmSwift

struct DummyData {
    static var userLong: User = {
        let userDetail = User()
        userDetail.id = "1"
        userDetail.name = "Long"
        userDetail.avatarName = "1"
        userDetail.descriptionName = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  asaasas  asasasaasaaaas sasasasasasasasdskjfksafjksjfsdjfdskfjdslkfjsdlkjvdsklvnx,mvnm,xcvncxmvnxzm,vnzxmvnxzm,nv,mxz"
        let a = List<Comment>()
        let c = Comment()
        c.content = "asdasd"
        c.createdDate = Date()
        c.user = userNam
        a.append(c)
        userDetail.comments = a
        let b = List<String>()
        b.append("1")
        b.append("2")
        b.append("3")
        b.append("4")
        b.append("6")
        userDetail.coverImageNames = b
        return userDetail
    }()

    static var userNam: User = {
        let user = User()
        user.id = "2"
        user.name = "Nam"
        user.avatarName = "3"
        user.descriptionName = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  asaasas  asasasaasaaaas sasasasasasasasdskjfksafjksjfsdjfdskfjdslkfjsdlkjvdsklvnx,mvnm,xcvncxmvnxzm,vnzxmvnxzm,nv,mxz"
        return user
    }()

    static var userVinh: User = {
        let user = User()
        user.id = "3"
        user.name = "Vinh"
        user.avatarName = "4"
        user.descriptionName = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  asaasas  asasasaasaaaas sasasasasasasasdskjfksafjksjfsdjfdskfjdslkfjsdlkjvdsklvnx,mvnm,xcvncxmvnxzm,vnzxmvnxzm,nv,mxz"
        return user
    }()
}
