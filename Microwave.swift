//
//  Microwave.swift
//
//  Created by Atri Sarker
//  Created on 2025-9-23
//  Version 1.0
//  Copyright (c) 2025 Atri Sarker. All rights reserved.
//
//  Program that gets the amount of time to reheat food in a microwave,
//  given a food choice and quantity.

// Amount of time to reheat a single sub in seconds.
let SUB_REHEAT_TIME = 60
// Amount of time to reheat a single slice of pizza in seconds.
let PIZZA_REHEAT_TIME = 45
// Amount of time to reheat a single bowl of soup in seconds.
// 1 minute and 45 seconds.
let SOUP_REHEAT_TIME = 105
// Array to hold all the food choices.
let FOOD_CHOICES = [
    "SUB",
    "PIZZA",
    "SOUP"
]

// Maximum quantity of food that the microwave can hold.
let MAX_QUANTITY = 3

// Constant to define the amount of seconds in a minute.
let SECONDS_PER_MINUTE = 60

// Display all food choices
print("Food choices: \(FOOD_CHOICES)")
// Prompt for food choice.
print("Enter your food choice: ", terminator: "")
// Get user's food choice as a string
let userFoodChoiceInput = readLine() ?? ""
// Convert user input to uppercase to match array values.
let userFoodChoice = userFoodChoiceInput.uppercased()
// Check if the user input is a valid food choice.
if FOOD_CHOICES.contains(userFoodChoice) {
    // Prompt for quantity.
    print("Enter the quantity (1-\(MAX_QUANTITY)): ", terminator: "")
    // Get quantity as a string.
    if let quantityAsString = readLine() {
        // Convert quantity input to an integer.
        if let quantity = Int(quantityAsString) {
            // Check if the quantity is within the valid range.
            if quantity >= 1 && quantity <= MAX_QUANTITY {
                // Initialize reheat time variable for a single item.
                var baseReheatTime = 0
                // Determine the reheat time based on food choice.
                if userFoodChoice == "SUB" {
                    baseReheatTime = SUB_REHEAT_TIME
                } else if userFoodChoice == "PIZZA" {
                    baseReheatTime = PIZZA_REHEAT_TIME
                } else if userFoodChoice == "SOUP" {
                    baseReheatTime = SOUP_REHEAT_TIME
                }
                // Apply the quantity formula on the base reheat time.
                // To get the actual reheat time. [in seconds]
                let actualReheatTime = baseReheatTime * (quantity + 1) * 0.5
                // Convert pure seconds to a combination of minutes and seconds.
                let minutes = actualReheatTime / SECONDS_PER_MINUTE
                let seconds = actualReheatTime % SECONDS_PER_MINUTE
                // Display the result. [IN BLUE]
                print("\u{001B}[0;34mReheat time: \(minutes)", terminator: "")
                print(" minute(s) and \(seconds) second(s).")
            } else {
                // Error message for invalid quantity. [IN RED]
                print("\u{001B}[0;31mERROR: INVALID QUANTITY", terminator: "")
                print(" IT MUST BE BETWEEN 1 AND \(MAX_QUANTITY)")
            }
        } else {
            // Error message for non-integer quantity. [IN RED]
            print("\u{001B}[0;31mERROR: QUANTITY MUST BE AN INTEGER")
        }
    }
} else {
    // Error message for invalid food choice. [IN RED]
    print("\u{001B}[0;31mERROR: INVALID FOOD CHOICE")
}