Set scrEnc = CreateObject("Scripting.Encoder")
Set scrFSO = CreateObject("Scripting.FileSystemObject")
 
    myfile = scrFSO.OpenTextFile("a.vbs").ReadAll
    If scrFSO.FileExists("fichier_encode.vbe") Then scrFSO.DeleteFile "fichier_encode.vbe", True
    myFileEncode=scrENC.EncodeScriptFile(".vbs", myfile, 0, "")
 
    Set ts = scrFSO.CreateTextFile("fichier_encode.vbe", True, False)
    ts.Write "'**Start Encode**" + vbcrlf + myFileEncode
ts.close