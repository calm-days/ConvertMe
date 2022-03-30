//
//  ContentView.swift
//  ConvertMe
//
//  Created by Роман Люкевич on 12/03/2022.
//

import SwiftUI

struct ContentView: View {
    let tempUnits: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var inputValue = 0.0
    
    var computatedOutput: Double {
        
        if inputUnit == "Celsius" && outputUnit == "Celsius" {
            return inputValue
        }
        
        if inputUnit == "Celsius" && outputUnit == "Fahrenheit" {
            return 1.8 * inputValue + 32
        }
        
        if inputUnit == "Celsius" && outputUnit == "Kelvin" {
            return inputValue + 273.15
        }
        
        
        
        if inputUnit == "Fahrenheit" && outputUnit == "Celsius" {
            return (inputValue - 32)/1.8
        }
        
        if inputUnit == "Fahrenheit" && outputUnit == "Fahrenheit" {
            return inputValue
        }
        
        if inputUnit == "Fahrenheit" && outputUnit == "Kelvin" {
            return (inputValue - 32)/1.8 + 273.15
        }
        
        
        
        if inputUnit == "Kelvin" && outputUnit == "Celsius" {
            return inputValue - 273.15
        }
        
        if inputUnit == "Kelvin" && outputUnit == "Fahrenheit" {
            return 1.8 * (inputValue - 273.15) + 32
        }
        
        if inputUnit == "Kelvin" && outputUnit == "Kelvin" {
            return inputValue
        }
        
        return inputValue
    }
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                
                Section{
                    Picker("Input unit", selection: $inputUnit){
                        ForEach (tempUnits, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                    
                    TextField ("input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Input value")
                }
                
                Section{
                    Picker("Input unit", selection: $outputUnit){
                        ForEach (tempUnits, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                    
                    Text("\(computatedOutput.formatted())")
                    
                } header: {
                    Text("Output value")
                }
                
                
            } .navigationTitle("ConvertMe")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
