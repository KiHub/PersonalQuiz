//
//  Questions.swift
//  PersonalQuiz
//
//  Created by  Mr.Ki on 23.07.2021.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Каку пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравится больше?",
                type: .multiply,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любити ли вы поездки на маштне?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "Нервничаю", type: .cat),
                    Answer(text: "Незамечаю", type: .rabbit),
                    Answer(text: "Обожаю", type: .turtle)
                ]
            )
            
        ]
        
    }
    
}
