#!/bin/node

var child_process = require("child_process")
var programa = process.argv.slice(2).join(" ")
var clave = "ENOENT"
var a = child_process.execSync(`r && strace ${programa} 2>&1 | grep -i ${clave}`).toString()
var k = a.split("\n").filter(x=>x).map(x=>{
	var b = x.split("\"")
	var c = b && b[2].includes(clave) && b[1] || ""
	var w = child_process.execSync(`lnul6 ${c}`).toString()
	console.log(w)
})
