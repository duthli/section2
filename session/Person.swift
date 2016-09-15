//
//  Person.swift
//  session
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import Foundation
class Person{
    static var arrFirstNameMen : [String]!
    static var arrFirstNameWomen : [String]!
    static var arrLastName : [String]!
    static var arrMiddleNameMen : [String]!
    static var arrMiddleNameWomen : [String]!
    
    var fullName : String!
    var firstName : String!
    var middleName : String!
    var lastName : String!
    var numberPhone : String = String("+84")
    
    static var isCheck : Bool = true
    
    init(){
    
        if (Person.isCheck == true){
            Person.arrFirstNameMen = ["Anh", "Bắc", "Biên", "Chung", "Chiến", "Chính", "Công", "Dương", "Dũng", "Đạo", "Điền", "Đạt", "Kiên", "Kiểm", "Long", "Mạnh", "Nam", "Nhân", "Phúc", "Phước", "Phú", "Quảng", "Quân", "Sáng", "Trung", "Tú", "Cần", "Minh", "Phương", "Thế", "Duy", "Cường", "Huy", "Thắng", "Tiến", "Tùng", "Bình"]
            Person.arrFirstNameWomen = ["An", "Anh", "Ánh", "Chung", "Dung", "Giang", "Hằng", "Hương", "Khánh", "Liên", "Linh", "Liễu", "Mai", "Nhi", "Nhung", "Oanh", "Phúc", "Quyên", "Quỳnh", "Thuỷ", "Thảo", "Tú", "Phương",  "Hoa", "Huệ", "Uyên",  "Xinh", "Yến"]
            Person.arrMiddleNameMen = ["Văn", "Đăng", "Bảo", "Đình", "Minh", "Vĩnh", "Hữu", "Công", "Khắc", "Duy", "Kim", "Thế", "Xuân"]
            Person.arrMiddleNameWomen = ["Thị", "Ngọc", "Thuỳ"]
            Person.arrLastName = ["Hoàng", "Trần", "Nguyễn", "Đặng", "Phạm", "Trịnh", "Đỗ", "Đinh", "Lê", "Vũ", "Bùi", "Hồ", "Ngô", "Dương", "Lý", "Lương", "Doãn"]
            Person.isCheck = false
        }
        let genderIdx = arc4random_uniform(2)
        if (genderIdx == 0){
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
        } else {
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
        }
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        
        fullName = lastName + " " + middleName + " " + firstName
        
        for i in 0...10{
            let name = String(Int(arc4random_uniform(UInt32(10))))
            numberPhone = numberPhone + name
        }
    }
}