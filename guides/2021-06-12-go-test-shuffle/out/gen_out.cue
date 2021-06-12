package out

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
FilenameComment: false
Steps: {
	start_dir: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "start_dir"
		Order:           0
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "pwd"
			ExitCode: 0
			Output: """
				/home/gopher

				"""
			ComparisonOutput: """
				/home/gopher

				"""
		}, {
			Negated:          false
			CmdStr:           "mkdir public"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cd public"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	gopher_pkg_initial: {
		StepType: 2
		Name:     "gopher_pkg_initial"
		Order:    1
		Terminal: "term1"
		Language: "go"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package public

			import (
			    "fmt"
			    "io/ioutil"
			)

			func DoSomething() {
			    fmt.Fprintf(ioutil.Discard, "This doesn't print anything")
			}
			"""
		Target: "/home/gopher/public/public.go"
	}
	gopher_test_initial: {
		StepType: 2
		Name:     "gopher_test_initial"
		Order:    2
		Terminal: "term1"
		Language: "go"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package public

			import (
			    "fmt"
			    "io/ioutil"
			)

			func DoSomething() {
			    fmt.Fprintf(ioutil.Discard, "This doesn't print anything")
			}
			"""
		Target: "/home/gopher/public/public.go"
	}
	run_tests_initial: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "run_tests_initial"
		Order:           3
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go test -v ./..."
			ExitCode: 0
			Output: """
				?   \t_/home/gopher/public\t[no test files]

				"""
			ComparisonOutput: """
				?   \t_/home/gopher/public\t[no test files]

				"""
		}]
	}
}
Hash: "e03e1d16a64b8798a18b20dd3d9b6b2961d41983038f8e4f688cf1d41fede7d0"
Delims: ["{{{", "}}}"]
