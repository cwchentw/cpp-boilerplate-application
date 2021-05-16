# C++ Boilerplate for Application

A C++ boilerplate project to build a C++ based application.

## System Requirements

* C++ compiler (Clang or GCC)
* GNU Make (for compilation only)

## Usage

Clone the project:

```
$ git clone https://github.com/cwchentw/cpp-boilerplate-application.git myapp
```

Move your working directory to the root of *myapp*:

```
$ cd myapp
```

Modify *main.cc* as needed. You may add or remove C source files (*.c*) or C++ source files (*.cc*, *.cpp* or *.cxx*) as needed.

Compile the application:

```
$ make
```

Run the compiled program:

```
$ ./dist/program
```

Set your own remote repository:

```
$ git remote set-url origin https://example.com/user/project.git
```

Push your modification to your own repo:

```
$ git push
```

## Project Configuration

Here are the parameters in *Makefile*:

* **PROGRAM**: the name of the compiled program
* **C_STD**: the C standard as a GCC C dialect
* **CXX_STD**: the C++ standard as a GCC C++ dialect

## Note

You may mix C and C++ in the same project as well.

The project assumes a Unix console environment. Windows users can install [MSYS2](https://www.msys2.org/) to obtain a decent Unix environment.

Because seldom Visual C++ users compile programs with Make, we don't include the compiler in the project.

## Copyright

Copyright (c) 2020 Michael Chen. Licensed under MIT.