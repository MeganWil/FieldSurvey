//
//  FieldSurveyJsonParser.swift
//  Field Survey
//
//  Created by Megan Wilson on 7/19/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import Foundation
class FieldSurveyJsonParser{
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [FieldSurvey] {
        var fieldSurveys = [FieldSurvey]()
        dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok"{
            
            if let observations = root["observations"] as? [Any]{
                for observation in observations{
                    if let observation = observation as? [String: String]{
                        if let classificationName = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let fieldSurvey = FieldSurvey(classificationName: classificationName, title: title, description: description, date: date){
                                fieldSurveys.append(fieldSurvey)
                            }
                        }
                    }
                }
            }
        }
        return fieldSurveys
    }
}
