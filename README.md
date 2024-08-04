# SMT32_StepperMotor_Servo
A control system made up of a stepper motor and a potentiometer to maintain a set position or speed. Controlling the servo will be done via the UART interface.

## IDE
The IDE I use for programming is [Visual Code Studio](https://code.visualstudio.com/).

## Build
To build project you need:
- [make](https://www.gnu.org/software/make/#download)
- [GCC compiler](https://gcc.gnu.org/install/download.html)

The project can be compiled using the command.
``` Bash
make App
```

## Flash
To flash our board we will need:
- [Open OCD](https://openocd.org/pages/getting-openocd.html)

With Open OCD we will also be able to debug our code, which is really very useful when analyzing bugs, especially with more complex projects.

Of course, the program alone is not enough and we will need a hardware part: a programmer. I will be using the ST-Link V2 programmer, as it is already built into the [Nucleo board](https://www.ebay.co.uk/p/25020387073) I am using for this project.

For more information on available commands, use the command:
``` Bash
make help
```

## Directory structure
| Directory            | Description                                                           |
|----------------------|-----------------------------------------------------------------------|
| build/               | Build output (object files + executable)                              |
| build_debug/         | Build output with debug information (object files + executable)       |
| Application/         | Source files for the application layer                                |
| Common/              | Source files for code used across the project                         |
| Core/                | Start-up files, configuration files, manufacturer's header files      |
| Documnets/           | Documentation (e.g., SW architecure, diagrams, images)                |
| Drivers/             | Source files for the driver layer (see SW architecture)               |
| Makefiles/           | Folder contains main makefile and compile configuration               |