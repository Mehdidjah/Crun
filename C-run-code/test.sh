#!/bin/bash
# Enhanced test script for c

C="./c"
PASS=0
FAIL=0

test_case() {
    local name="$1"
    local cmd="$2"
    local expected="$3"
    
    echo -n "Testing: $name ... "
    result=$(eval "$cmd" 2>&1) || true
    
    if [[ "$result" == "$expected" ]] || [[ "$result" == *"$expected"* ]]; then
        echo "PASS"
        PASS=$((PASS + 1))
    else
        echo "FAIL"
        echo "  Expected: $expected"
        echo "  Got: $result"
        FAIL=$((FAIL + 1))
    fi
}

test_case_no_output() {
    local name="$1"
    local cmd="$2"
    
    echo -n "Testing: $name ... "
    if eval "$cmd" >/dev/null 2>&1; then
        echo "PASS"
        PASS=$((PASS + 1))
    else
        echo "FAIL"
        FAIL=$((FAIL + 1))
    fi
}

echo "Running enhanced tests for c script"
echo "===================================="
echo

# Basic functionality tests
echo "=== Basic Functionality ==="
test_case "version flag" "$C --version" "0.16.0"
test_case "help flag" "$C --help" "Usage:"
test_case "hello world" "$C examples/hello.c" "Hello World!"
test_case "with arguments" "$C examples/hello_args.c foo bar" "argc=3"
test_case "math example" "$C 'examples/math_example.c -lm'" "1024"
test_case "multi-file" "$C 'examples/multi_file/main.c examples/multi_file/helper.c'" "Main function"
echo

# New feature tests
echo "=== New Features ==="
test_case "compiler info" "$C --compiler-info" "Compiler Information"
test_case "cache info" "$C --cache-info" "Cache"
test_case_no_output "verbose mode" "$C -v examples/hello.c"
test_case_no_output "time mode" "$C --time examples/hello.c"
test_case "dry-run mode" "$C --dry-run examples/hello.c" "Would execute"
test_case_no_output "list cache" "$C --list-cache"
test_case_no_output "clear cache" "$C --clear-cache"
echo

# Cache functionality
echo "=== Cache Functionality ==="
$C examples/hello.c >/dev/null 2>&1
test_case "cache hit" "$C examples/hello.c" "Hello World!"
test_case "cache info after use" "$C --cache-info" "Cached binaries"
echo

echo "===================================="
echo "Tests completed: $PASS passed, $FAIL failed"

if [[ $FAIL -gt 0 ]]; then
    exit 1
fi
