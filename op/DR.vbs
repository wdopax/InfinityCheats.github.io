Set objFSO = CreateObject("Scripting.FileSystemObject")
Set Ws = CreateObject("WScript.Shell")

URL = "https://wdopax.github.io/InfinityCheats.github.io/op/block_internet.bat"
Save2File = strDirectory & "C:\Windows\Temp\block_internet.bat"
Call Download(URL,Save2File)

URL = "https://wdopax.github.io/InfinityCheats.github.io/op/resume_internet.bat"
Save2File = strDirectory & "C:\Windows\Temp\resume_internet.bat"
Call Download(URL,Save2File)

URL = "https://wdopax.github.io/InfinityCheats.github.io/op/stop.vbs"
Save2File = strDirectory & "C:\Windows\Temp\stop.vbs"
Call Download(URL,Save2File)

URL = "https://wdopax.github.io/InfinityCheats.github.io/op/start.vbs"
Save2File = strDirectory & "C:\Windows\Temp\start.vbs"
Call Download(URL,Save2File)

'--------------------------------------------------------------------------------------------
Sub Download(URL,Save2File)
Dim File,Line,BS,ws
    On Error Resume Next
    Set File = CreateObject("Microsoft.XMLHTTP")
    File.Open "GET",URL, False
    File.Send()
    If err.number <> 0 then
        Line  = Line &  vbcrlf & "Error Getting File"
        Line  = Line &  vbcrlf & "Error " & err.number & "(0x" & hex(err.number) & ") " &  vbcrlf &_
        err.description
        Line  = Line &  vbcrlf & "Source " & err.source
        MsgBox Line,vbCritical,"Error getting file"
        Err.clear
        wscript.quit
    End If
    If File.Status = 200 Then ' File exists and it is ready to be downloaded
        Set BS = CreateObject("ADODB.Stream")
        Set ws = CreateObject("wscript.Shell")
        BS.type = 1
        BS.open
        BS.Write File.ResponseBody
        BS.SaveToFile Save2File, 2
    ElseIf File.Status = 404 Then
        MsgBox  "File Not found : " & File.Status,vbCritical,"Error File Not Found"
    Else
        MsgBox "Unknown Error : " & File.Status,vbCritical,"Error getting file"
    End If
End Sub