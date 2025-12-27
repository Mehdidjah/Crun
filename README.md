# c

> "There isn't much that's special about C. That's one of the reasons why it's fast."

A simple shell script that compiles and executes C/C++/Fortran "scripts" in one go! Write C code like you would write a bash script.

## Features

- 🚀 **Fast compilation and execution** - Compile and run C code instantly
- 📦 **Caching** - Automatic caching of compiled binaries for faster subsequent runs
- 🔧 **Multi-file support** - Compile multiple source files together
- 🎯 **Multiple languages** - Supports C, C++, and Fortran
- 📝 **Shebang support** - Run C files directly like scripts
- ⚙️ **Compiler flags** - Full support for compiler flags and linking libraries

## Installation

### System-wide installation

```bash
# Download the script
wget https://raw.githubusercontent.com/Mehdidjah/c/master/c

# Install to /usr/local/bin (macOS) or /usr/bin (Linux)
sudo install -m 755 c /usr/local/bin/c

# Or for Linux systems
sudo install -m 755 c /usr/bin/c
```

### User-only installation

```bash
# Download the script
wget https://raw.githubusercontent.com/Mehdidjah/c/master/c

# Install to ~/.local/bin
mkdir -p ~/.local/bin
install -m 755 c ~/.local/bin/c

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

## Usage

### Basic Usage

```bash
# Compile and run a single C file
c hello.c

# With command-line arguments
c hello.c arg1 arg2
```

### Multiple Files

```bash
# Compile multiple files together
c 'main.c helper.c -lm'

# With compiler flags
c 'main.c other.c -O3 -Wall -lncurses' arg1 arg2
```

### Shebang Support

Add a shebang to your C file and run it directly:

```c
#!/usr/bin/env c
#include <stdio.h>

int main(void) {
    printf("Hello World!\n");
    return 0;
}
```

```bash
chmod +x hello.c
./hello.c
```

For multiple files with shebang:

```c
#!/usr/bin/env c file1.c file2.c -lncurses -lm --
```

### Examples

See the [examples](examples/) directory for more usage examples:

- `examples/hello.c` - Basic "Hello World"
- `examples/hello_args.c` - Command-line arguments
- `examples/math_example.c` - Linking with math library
- `examples/multi_file/` - Multi-file compilation

## Configuration

### Compiler Selection

The script uses your system's default compiler. You can override it:

```bash
export CC=clang    # Use Clang
export CC=gcc      # Use GCC
export CC=tcc      # Use TCC (Tiny C Compiler)
```

### Caching

By default, the cache size is 5 MB. You can change it:

```bash
export C_CACHE_SIZE=$((10*1024))  # 10 MB
```

The cache location defaults to `$TMPDIR/c.cache.$USER`. You can change it:

```bash
export C_CACHE_PATH="/tmp/my_cache"
```

### Clear Cache

```bash
c --clear-cache
```

## Supported Languages

- **C** - Files with `.c` extension
- **C++** - Files with `.cc`, `.cpp`, `.cxx`, `.c++` extensions
- **Fortran** - Files with `.f`, `.f95`, `.f77`, `.f90`, `.f03`, `.f15`, `.for` extensions

## Command-Line Options

```
Usage: c [OPTIONS] <FILE.C> [COMPILER_FLAGS] [ARGUMENTS]

OPTIONS
  --help, -h          Show help message
  --version           Show version information
  --clear-cache       Clear compilation cache
  --cache-info        Show cache information and statistics
  --list-cache        List all cached binaries with details
  --compiler-info     Show compiler version information
  --verbose, -v       Enable verbose output (debugging)
  --time              Show compilation and execution time
  --dry-run           Show what would be executed without running
```

## New Features in v0.16.0

### 🎨 Colored Output
Enhanced error messages and status indicators with color coding:
- 🟢 Green for success messages
- 🔴 Red for errors
- 🟡 Yellow for warnings
- 🔵 Blue for timing information
- 🔷 Cyan for informational messages

### 📊 Cache Management
```bash
# View cache statistics
c --cache-info

# List all cached binaries
c --list-cache

# Clear cache
c --clear-cache
```

### ⏱️ Performance Monitoring
```bash
# Show compilation and execution time
c --time hello.c
```

### 🔍 Verbose Mode
```bash
# See detailed compilation process
c -v hello.c
```

### 🧪 Dry Run Mode
```bash
# See what would be executed without running
c --dry-run hello.c arg1 arg2
```

### 🔧 Compiler Information
```bash
# Check your compiler setup
c --compiler-info
```

## Testing

Run the test suite:

```bash
./test.sh
```

## Requirements

- Bash shell
- A C compiler (gcc, clang, or tcc)
- A hash function (md5sum, sha256sum, sha1sum, or shasum)

## How It Works

1. The script parses your source files and compiler flags
2. It creates a hash of your source code and compiler settings
3. If a cached binary exists, it runs it directly
4. Otherwise, it compiles your code with optimization (`-O2`)
5. The compiled binary is cached for future use
6. Your program runs with the provided arguments

## Why?

This tool makes it easy to write small, fast C programs without the overhead of setting up a build system. Perfect for:

- Quick scripts and utilities
- Learning C programming
- Prototyping algorithms
- System administration scripts
- Performance-critical one-off programs

## Author

**Mehdi**

- GitHub: [@Mehdidjah](https://github.com/Mehdidjah)

## License

This project is based on the original work by [ryanmjacobs](https://github.com/ryanmjacobs/c) and is released under the MIT License.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## Acknowledgments

- Original concept and implementation by [ryanmjacobs](https://github.com/ryanmjacobs/c)
- Improved and maintained by [Mehdidjah](https://github.com/Mehdidjah)

