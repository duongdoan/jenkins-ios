//
//  JobList.swift
//  JenkinsiOS
//
//  Created by Robert on 23.09.16.
//  Copyright © 2016 MobiLab Solutions. All rights reserved.
//

import Foundation

class JobList: CustomStringConvertible{
    
    var allJobsView: View?
    var views: [View] = []
        
    init(json: [String: AnyObject]) throws{
        guard let viewsJson = json[Constants.JSON.views] as? [[String: AnyObject]]
            else { throw ParsingError.KeyMissingError(key: Constants.JSON.views) }
        
        for viewJson in viewsJson{
            if let view = View(json: viewJson){
                views.append(view)
                
                if view.name == Constants.JSON.allViews{
                    allJobsView = view
                }
            }
        }
    }
    
    var description: String{
        return "{\n" + (allJobsView?.jobs.reduce("", { (result, job) -> String in
            return "\(result) Name: \(job.name), Description: \(job.description) \n"
        }) ?? "No all view")
            + (views.reduce("Views: ", { (result, view) -> String in
                return "\(result)\(view)\n"
        }))
            + "}"
    }
}
