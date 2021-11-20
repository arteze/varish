#/bin/node

var child_process = require("child_process")
var programa = process.argv.slice(2).join(" ")
var clave = "ENOENT"
var a = child_process.execSync(`tput reset && strace ${programa} 2>&1 | grep -i ${clave}`).toString().split("\n")[1].split("\"")
console.log(a[2] && a[2].includes(clave)&&a[1]||"")
