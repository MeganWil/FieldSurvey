//
//  FieldSurveyJsonLoader.swift
//  Field Survey
//
//  Created by Megan Wilson on 7/19/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import Foundation

class FieldSurveyJsonLoader{
    
    class func load(filename: String) -> [FieldSurvey] {
        var observations = [FieldSurvey]()
        
        if let path = Bundle.main.path(forResource: filename, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = FieldSurveyJsonParser.parse(data)
        }
        
        return observations
    }
}

