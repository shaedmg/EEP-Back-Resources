#!/usr/bin/expect -f
set timeout -1
set var [lindex $argv 0]
set fields [lindex $argv 1] 
set route [lindex $argv 2]
cd $route
spawn yo rest:api
expect {
    "*What's the API name?" { send -- "$var\r" }
}
expect {
    "*What's the endpoint name?" { send -- "$var\r" }
}
expect {
    "*put the code?" { send -- "\r" }
}
expect {
    "*methods it will have?" { send -- "\r"}
}
expect {
    "*want to generate a model?" { send -- "y\r" }
}
expect {
    "*fields the model will have?" { send -- "$fields\r" }
}
expect {
    "*Do you want the retrieve" { send -- "n\r" }
}
expect {
    "*Overwrite src/api/index.js?" { send -- "y\r" }
}
expect eof
exit 0
