package main

import "log"

func main() {
	conf, err := readConfigFromEnv("")
	if err != nil {
		log.Fatalf("Error: %s", err)
		return
	}

	if conf.Username != "" {
		log.Printf("Hello %s.", conf.Username)
		return
	}

	log.Print("Hello World.")
}
