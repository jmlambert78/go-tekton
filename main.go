package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/itchyny/gojq"
)


func handler(w http.ResponseWriter, r *http.Request) {
	title := "Tekton build on SUSE CaaSP 4.1"

	from := ""
	if r.URL != nil {
		from = r.URL.String()
	}
	if from != "/favicon.ico" {
		log.Printf("title: %s\n", title)
	}

	fmt.Fprintf(w, "Hello from:  "+title+"\n")
}

func main() {
	query, err := gojq.Parse(".foo | ..")
	if err != nil {
		log.Fatalln(err)
	}
	input := map[string]interface{}{"foo": []interface{}{1, 2, 3}}
	iter := query.Run(input) // or query.RunWithContext
	for {
		v, ok := iter.Next()
		if !ok {
			break
		}
		if err, ok := v.(error); ok {
			log.Fatalln(err)
		}
		fmt.Printf("%#v\n", v)
	}
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}

