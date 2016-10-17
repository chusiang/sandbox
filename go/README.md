# Go | chusiang

## Setup

### Apt (Ubuntu)

    $ sudo apt-get install golang

### Homebrew (macOS)

    $ brew install golang
    
## Hello World

1. Write a `hello-world.go`.

        package main
        
        import "fmt"
        
        func main() {
            fmt.Println("hello world")
        }

2. Run it.
    
        $ go run hello-world.go
        hello world

3. Build it.
        
        $ go build hello-world.go
        $ ls
        hello-world	hello-world.go

4. Run compile binary file. 
        
        $ ./hello-world
        hello world
        

## Reference

- [Downloads - The Go Programming Language](https://golang.org/dl/)
- [Go by Example: Hello World](https://gobyexample.com/hello-world)