package guide

import (

	"github.com/play-with-go/preguide"
)

Defs: {
	_#commonDefs
	go115:              "go115"
	go116:              "go116"
	public:             "public"
	public_vcs:         "https://\(public_mod).git"
	public_mod:         "{{{.PUBLIC}}}"
	public_dir:         "/home/gopher/\(public)"
	public_go:          "\(public).go"
	public_go116:       "\(public)_116.go"
	public_func:        "DoSomething()"
	gopher:             "gopher"
	gopher_vcs:         "https://\(gopher_mod).git"
	gopher_mod:         gopher
	gopher_dir:         "/home/gopher/\(gopher)"
	gopher_go:          "\(gopher).go"
	go_help_env:        "\(_#commonDefs.cmdgo.help) env"
	go_help_modprivate: "\(_#commonDefs.cmdgo.help) module-private"
}

Scenarios: go115: preguide.#Scenario & {
	Description: "Go 1.17"
}

Terminals: term1: preguide.#Terminal & {
	Description: "The main terminal"
	Scenarios: go115: Image: _#go115LatestImage
}

Steps: start_dir: preguide.#Command & {
	Source: """
		pwd
		mkdir public
		cd public
		"""
}

Steps: gopher_pkg_initial: preguide.#Upload & {
	Target: "\(Defs.public_dir)/\(Defs.public_go)"
	Source: #"""
package \#(Defs.public)

import (
    "fmt"
    "io/ioutil"
)

func \#(Defs.public_func) {
    fmt.Fprintf(ioutil.Discard, "This doesn't print anything")
}
"""#
}

Steps: gopher_test_initial: preguide.#Upload & {
	Target: "\(Defs.public_dir)/\(Defs.public_go)"
	Source: #"""
package \#(Defs.public)

import (
    "fmt"
    "io/ioutil"
)

func \#(Defs.public_func) {
    fmt.Fprintf(ioutil.Discard, "This doesn't print anything")
}
"""#
}

Steps: run_tests_initial: preguide.#Command & {
	Source: """
		go test -v ./...
		"""
}