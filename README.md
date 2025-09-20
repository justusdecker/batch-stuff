# Batch-OOP-Framework: An Experimental OOP Concept in Batch Scripts

This repository contains an experimental framework for simulating **Object-Oriented Programming (OOP)** concepts in the Windows Batch scripting language. Since Batch isn't designed for OOP, this project uses advanced techniques like **dynamic variable names** and **function calls** to emulate classes, instances, and methods.

## Features

- **Class Emulation:** Create "object classes" like `class_generic`
- **Instantiation:** Each new instance automatically receives a unique ID via the `idx` function.
- **Data Encapsulation:** Object attributes are stored in variables with dynamic names (e.g., `_1_id`, `_1_width`) to encapsulate data per instance.
- **Method Simulation:** Functions like `func_rnd` and `get_file_info` serve as reusable methods that can be called.
- **File Path Parsing:** Utilizes built-in Batch modifiers to extract file properties like attributes, size, path, and extension.

---

## How it Works

The core of the framework is the dynamic generation of variable names. When a new instance is created, the script calls the `:idx` function, which increments the global `id` counter. This ID is then used as a prefix for all attributes of that instance.

### Classes

- **`:class_generic`**: A generic "class" for creating objects with `width` and `height` attributes. It calls `:idx` to generate a new, unique instance.


### Functions
- **`:func_rnd`**: A universal function that generates a random number within a defined range.
- **`:idx`**: The "factory" function that generates a new ID for an object instance and links the class name with the ID (e.g., `_1_id = class_map`).
---

## Example Usage

```batch
@echo off

:: Initialize the first instance with width=50, height=50
call :class_generic 50 50

:: Initialize the second instance with width=51, height=62
call :class_generic 51 62

:: Access the instance attributes
echo The ID of the second instance: %_2_id% 
echo The height of the first instance: %_1_height%
```

### How to run

* On first startup

```shell
make
```

* After compilation

```shell
./main.bat
```