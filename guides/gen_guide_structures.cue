package guides

"2021-06-12-go-test-shuffle": {
	Delims: ["{{{", "}}}"]
	Terminals: [{
		Name:        "term1"
		Description: "The main terminal"
		Scenarios: {
			go115: {
				Image: "playwithgo/go1.15.8@sha256:7640da09d1555c4dddbba7f1b96051af2816e6542005176b749f38865ee0454c"
			}
		}
	}]
	Scenarios: [{
		Name:        "go115"
		Description: "Go 1.17"
	}]
	Networks: ["playwithgo_pwg"]
	Env: []
}

