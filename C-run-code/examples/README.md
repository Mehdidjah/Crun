# Examples

This directory contains example C programs demonstrating how to use the `c` script.

## Basic Examples

### hello.c
Simple "Hello World" program:
```bash
./c examples/hello.c
```

### hello_args.c
Program that prints command-line arguments:
```bash
./c examples/hello_args.c arg1 arg2 arg3
```

## Advanced Examples

### math_example.c
Demonstrates linking with math library using shebang:
```bash
# Make executable and run directly
chmod +x examples/math_example.c
./examples/math_example.c

# Or run via c script
./c 'examples/math_example.c -lm'
```

### Multi-file Compilation

The `multi_file/` directory shows how to compile multiple source files:

```bash
./c 'examples/multi_file/main.c examples/multi_file/helper.c'
```

This compiles both `main.c` and `helper.c` together.

## Running Tests

Run the test suite:
```bash
./test.sh
```

