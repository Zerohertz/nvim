SHELL := /bin/bash

.PHONY: all
all: sh c cpp cmake rust go java python js ts lua

.PHONY: sh
sh:
	sh/main.sh

.PHONY: c
c:
	gcc c/main.c -o main && ./main && rm ./main

.PHONY: cpp
cpp:
	g++ cpp/main.cpp -o main && ./main && rm ./main

.PHONY: cmake
cmake:
	cd cmake && rm -rf build && mkdir build && cd build && cmake .. && make && ./main && rm ./main

.PHONY: rust
rust:
	rustc rust/src/main.rs && ./main && rm ./main

.PHONY: go
go:
	go run go/main.go

.PHONY: java
java:
	java java/Main.java

.PHONY: python
python:
	python python/main.py

.PHONY: js
js:
	node javascript/main.js

.PHONY: ts
ts:
	tsc typescript/main.ts && node typescript/main.js && rm typescript/main.js

.PHONY: lua
lua:
	lua lua/main.lua
