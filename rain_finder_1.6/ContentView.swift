//
//  ContentView.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let dataProvider = DataProvider()
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear(){
            deleteAllData()
            dataProvider.loadCsvData(then: {result in
                switch result{
                case .success(let string):
                    let csvData = string.components(separatedBy: "\"n").dropFirst().dropLast()
                    for airports in csvData{
                        let airport = airports.components(separatedBy: ",")
                        viewContext.perform {
                            getRecordsCount()
                            addAirportToDB(airport: airport)
                        }
                        
                        
                    }
                case .failure(let error):
                    print("error \(error)")
                }
            })
        }
    }
    func addAirportToDB(airport: [String]) {
        let newAirport = AirportEntity(context: viewContext)
        newAirport.type = airport[2]
        newAirport.elevation_ft = airport[6]
        newAirport.gps_code = airport[11]
        newAirport.home_link = airport[14]
        newAirport.iata_code = airport[12]
        newAirport.ident = airport[1]
        newAirport.iso_country = airport[8]
        newAirport.latitude_deg = airport[4]
        newAirport.longitude_deg = airport[5]
        newAirport.name = airport[3]
        newAirport.scheduled_service = airport[10]
        newAirport.keywords = airport[16]
        newAirport.local_code = airport[13]
        newAirport.municipality = airport[10]
        newAirport.wikipedia_link = airport[15]
        newAirport.id = airport[0]
        newAirport.continent = airport[7]
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
    func deleteAirportByIcaoCode(icaoCode: String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AirportEntity")
        fetchRequest.predicate = NSPredicate(format: "icaoCode MATCHES %@", icaoCode)
        fetchRequest.fetchLimit = 1
        fetchRequest.returnsObjectsAsFaults = false
        if let result = try? viewContext.fetch(fetchRequest){
            for airport in result{
                viewContext.delete(airport as! NSManagedObject)
            }
        }
        do{
            try viewContext.save()
        }catch let error{
            print("Couldn't delete \(icaoCode) error :", error)
        }
    }
    
    func getRecordsCount() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AirportEntity")
        do {
            let count = try viewContext.count(for: fetchRequest)
            print("number of records in DB is \(count)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AirportEntity")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
                try viewContext.save()
            }
        } catch let error {
            print("Detele all data in \("AirportEntity") error :", error)
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
