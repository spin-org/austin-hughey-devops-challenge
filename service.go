package main

import (
	"net"
	"fmt"
	"os"
	// "io"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
	  port = "8000"
	}

	fmt.Println("Starting up on port:", port)

	ln, err := net.Listen("tcp", ":" + port)
	if err != nil {
		fmt.Println("Error listening on port:", port)
		fmt.Println(err.Error())
		os.Exit(1)
	}
	for {
		conn, err := ln.Accept()
		if err != nil {
			fmt.Println("Error accepting: ", err.Error())
			os.Exit(1)
		}
		go handleRequest(conn, port)
	}
}

func handleRequest(conn net.Conn, port string) {
	// Spit something out on the local server
	fmt.Println("Received TCP Connection (local <-> remote)", conn.LocalAddr(), " <-> ", conn.RemoteAddr)

	// Tell the user something
	conn.Write([]byte("Hello! From goservice.go"))

	// What happens if the user closes their connection?
	// TODO: This seems a little half-baked so maybe redo it better in a future
	// iteration.
	//
	// _, err := conn.Read(make([]byte, 0))
	// if err != io.EOF {
	// 	fmt.Println("Remote user closed connection:", conn.RemoteAddr())
	// }
}
