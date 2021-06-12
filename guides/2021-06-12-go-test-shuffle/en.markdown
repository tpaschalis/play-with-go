---
layout: post
title:  "Shuffling Go tests"
excerpt: "Foo!"
difficulty: Beginner
category: New features in Go 1.17
---

So let's start 

{{{ step "start_dir" }}}

Aaaand end it!

*By [Paschalis Tsilias](https://twitter.con/tpaschalis_), Go developer*.

This feature is not released yet, it will be available on Go 1.17  
https://github.com/play-with-go/play-with-go/commit/8216b20868b8634600c65032cfcd7ca452d032ac.

### Intro
Testing is a first-class citizen in the Go ecosystem. This means that the barrier to testing Go projects is lower, and that there is little cognitive overhead to reading and understanding test code in unfamiliar projects. 

But once suites start growing, unwanted dependencies may appear between different test functions. In some cases, the suite may appear healthy, but fail if the tests are run in a different order. 

This guide will walk you through creating a new Go package and its test suite, which appears to run correctly, but contains a subtle flaw. 
You will use the new `-shuffle` flag to uncover this defect, and enforce randomization of test ordering to avoid such issues reappearing in the future. So, let’s get into it!

### The `gopher` package
So let’s build a new package by creating a folder and initializing a Go module.

{{{ step "gopher_pkg_initial" }}}

(package code, maybe initializing and using a dummy database connection). Explain what code does in a high-level.


### Let’s test it!
So let’s create a `gopher_test.go` file which will test the functionality present in the `gopher` package.

{{{ step "gopher_test_initial" }}}

We can run the tests by typing `go test ./…`. 

{{{ step "run_tests_initial" }}}

We can also measure the code coverage by providing the `-cover` flag, so let’s go ahead and do that, by running `go test ./… -cover`
It seems that we have achieved 100% coverage and our CI system should be green! Every developer’s dream, right?

### Let’s shuffle things up!
Some of you may be already raising some concerns regarding the tests we wrote. They contain a subtle flaw that may not be immediately apparent. 

Let’s run the test suite again and randomize the execution order. Do that by using `go test ./… -shuffle=on`. You may need to run a couple of times until you get a failure.
How will this be deterministic? → Use a seed and just note of -shuffle=on for the reader to use

You can see that once the tests have been run in a different order, a failure comes up. That’s because <... depends on example code …>. 

Go reports the seed value that resulted in the failure, so that once you notice such failure in an external CI system, or a co-worker’s machine, you can reproduce it anywhere just by running `go test ./… -shuffle=N`.

### Along the -count flag 
The `-count` flag is often used with the go test command, either to disable caching or uncover flaky tests. 

Whenever the `-shuffle` and `-count` flags are used together, the execution order will be randomized once at the start, and then re-used for the next runs. This can help to spot rare cases of flaky tests failing for specific test seeds.

### Conclusion
That’s all! This guide has introduced the `-shuffle` flag for the go test command, demonstrating how test reordering can uncover flaws in our test suite, and how it can help detect and prevent such issues in the future. 

As a next step you might like to consider:
* []()
* []()


