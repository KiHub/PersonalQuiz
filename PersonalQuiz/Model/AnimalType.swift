//
//  AnimalType.swift
//  PersonalQuiz
//
//  Created by  Mr.Ki on 23.07.2021.
//

enum AnimalType: String {
    case cat = "🐱"
    case dog = "🐶"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями и гулять"
        case .cat:
            return "Вы сами по себе и люьите гулять ночью"
        case .rabbit:
            return "Вам нравится бегать, вы полны энергии"
        case .turtle:
            return "Ваша супер сила в мудрости, вы выигрываете на дальних дистанциях"
        }
    }
    
}
