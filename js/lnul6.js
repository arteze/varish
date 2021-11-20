#/bin/node

var child_process = require("child_process")
var programa = process.argv.slice(2).join(" ")
var a = child_process.execSync(`r && strace ${programa} 2>&1 | grep -i such`).toString().split("\n")[1].split("\"")
console.log(a[2] && a[2].includes("ENOENT")&&a[1]||"")
