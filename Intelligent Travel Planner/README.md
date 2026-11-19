# Intelligent Travel Planner using Turbo Prolog 2.0

## Project Overview

The Intelligent Travel Planner is a Prolog-based application that helps travellers find the best route between two cities.

It considers three preferences:
- **Cheapest:** Finds the route with the lowest travel cost.
- **Shortest:** Finds the route with the minimum distance.
- **Fastest:** Finds the route with the minimum travel time.

The user enters the source city, destination city, city to avoid (or `none`), and travel preference. The program recommends a suitable route based on the selected preference.

## Technologies Used

- Turbo Prolog 2.0
- DOSBox 0.74

## Features

1. Represents multiple cities and their connections.
2. Stores distance, travel time, and travel cost.
3. Accepts source and destination cities from the user.
4. Provides three route preferences: cheapest, shortest, and fastest.
5. Calculates the total distance, time, and cost.
6. Allows the user to avoid a particular city.
7. Displays a message when no route is available.

## Cities and Connections

The program uses the following connections:

| Connection | Distance | Time | Cost |
|---|---:|---:|---:|
| A - B | 100 km | 2 hours | Rs. 250 |
| B - F | 250 km | 4 hours | Rs. 600 |
| A - C | 120 km | 2 hours | Rs. 400 |
| C - F | 200 km | 3 hours | Rs. 700 |
| B - D | 150 km | 3 hours | Rs. 350 |
| D - E | 100 km | 2 hours | Rs. 200 |
| E - F | 180 km | 3 hours | Rs. 450 |
| C - E | 160 km | 2 hours | Rs. 300 |

## Sample Test Cases

### Test Case 1: Cheapest Route

**Input:**
```text
Source city: a
Destination city: f
City to avoid: none
Preference: cheapest
```

**Expected Output:**
```text
RECOMMENDED ROUTE

Route: [a,b,f]
Total Distance: 350 km
Total Time: 6 hours
Total Cost: Rs. 850
Preference: cheapest
```

**Explanation:** The route A → B → F has the lowest total cost of Rs. 850.

### Test Case 2: Shortest Route

**Input:**
```text
Source city: a
Destination city: f
City to avoid: none
Preference: shortest
```

**Expected Output:**
```text
RECOMMENDED ROUTE

Route: [a,c,f]
Total Distance: 320 km
Total Time: 5 hours
Total Cost: Rs. 1100
Preference: shortest
```

**Explanation:** The route A → C → F has the shortest distance of 320 km.

### Test Case 3: Fastest Route

**Input:**
```text
Source city: a
Destination city: f
City to avoid: b
Preference: fastest
```

**Expected Output:**
```text
RECOMMENDED ROUTE

Route: [a,c,f]
Total Distance: 320 km
Total Time: 5 hours
Total Cost: Rs. 1100
Preference: fastest
```

**Explanation:** Since city B is avoided, the program selects A → C → F, which takes 5 hours.

## How to Run the Project

1. Download or clone this repository.
2. Open DOSBox 0.74.
3. Mount the folder containing Turbo Prolog:
   ```text
   mount c c:\prolog
   c:
   ```
4. Start Turbo Prolog:
   ```text
   prolog
   ```
5. Open the `TRAVEL.PRO` source file.
6. Compile the program using `F9`.
7. Run the program using the Run menu.
8. Enter the required details and view the recommended route.

## Concepts Used

- Facts and Rules
- Predicates
- Recursion
- Lists
- Graph Search
- Route Comparison
- Route Optimisation

## Conclusion

This project demonstrates how Prolog can be used to solve a real-world route-planning problem. It compares different routes based on distance, time, and cost and recommends a route according to the user's preference.
