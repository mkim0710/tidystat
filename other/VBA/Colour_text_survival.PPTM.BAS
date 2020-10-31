Option Explicit
        
Sub Colour_text_survival()
    Dim oSld As Slide
    Dim oShp As Shape
    Dim II As Integer
'    Dim I As Integer
    Dim oTxtRng As TextRange
    'Dim lst() As New List(Of String())
    'Dim CollectionOfObject As New Microsoft.VisualBasic.Collection()
    
    For Each oSld In ActivePresentation.Slides  '~~> Loop through each Slides
        For Each oShp In oSld.Shapes  '~~> Loop through each "Shapes" inside this "(Application.)ActivePresentation.Slides"
'            If oShp.Type = msoGroup Then  '~~> Check the ".Type" of this "Shapes"??? Not necessary???
'                For II = 1 To oShp.GroupItems.Count
'                    Call fFindAndColourText(oShp.GroupItems(II), TargetList_black, RGB(0, 0, 0))
'                Next II
'            Else
'                Call fFindAndColourText(oShp, TargetList_black, RGB(0, 0, 0))
'            End If
            If oShp.HasTextFrame Then  '~~> Check if each of the "Shapes" has TextFrame???
                If oShp.TextFrame.HasText Then  '~~> Check if each of the "Shapes.TextFrame" has Text??? Not necessary???
                    Set oTxtRng = oShp.TextFrame.TextRange  '~~> Get ".TextRange" from the "Shapes.TextFrame"
                    
                    '~~>  Array of terms to search for
'                    TargetList_Underline = Array()
'                    Call fFindAndUnderlineText(oTxtRng, TargetList_Underline)
'
'                    TargetList_Bold = Array()
'                    Call fFindAndBoldText(oTxtRng, TargetList_Bold)
                    
'                    TargetList_red = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_red, oNewRGB:=RGB(250, 0, 0))
                    
                    Dim TargetList_maroon() As Variant
                    TargetList_maroon = Array("%", "#", "~", "(", ")", ".", "$", "=", "<-", "%>%", "replicate", "lapply", "map", "function", "source", "caution")
                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_maroon, oNewRGB:=RGB(150, 0, 0))

'                    TargetList_orangered = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_orangered, oNewRGB:=RGB(250, 70, 0))
'
'                    TargetList_orange = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_orange, oNewRGB:=RGB(250, 150, 0))
'
'                    TargetList_gold = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_gold, oNewRGB:=RGB(250, 200, 0))
'
'                    TargetList_yellow = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_yellow, oNewRGB:=RGB(250, 250, 0))
'
'                    Dim TargetList_olive() As Variant
'                    TargetList_olive = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_olive, oNewRGB:=RGB(150, 150, 0))

                    Dim TargetList_lime() As Variant
                    TargetList_lime = Array("date")
                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_lime, oNewRGB:=RGB(0, 250, 0))

'                    TargetList_green = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_green, oNewRGB:=RGB(0, 150, 0))

                    Dim TargetList_cyan() As Variant
                    TargetList_cyan = Array("time", "event", "strata", "Exposed", "Case", "Ctrl", "diff")
                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_cyan, oNewRGB:=RGB(0, 250, 250))

'                    TargetList_teal = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_teal, oNewRGB:=RGB(0, 150, 150))
                    
                    Dim TargetList_blue() As Variant
                    TargetList_blue = Array("survfit", "Surv")
                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_blue, oNewRGB:=RGB(0, 0, 250))
                    
'                    TargetList_navy = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_navy, oNewRGB:=RGB(0, 0, 150))
                    
                    Dim TargetList_magenta() As Variant
                    TargetList_magenta = Array(".gt", "Match", "caliper", "PSMatch", "IVMatch", "MahalMatch", "1_2", "1_3", "1_5", "1_10")
                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_magenta, oNewRGB:=RGB(250, 0, 250))

'                    TargetList_purple = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_purple, oNewRGB:=RGB(150, 0, 150))
'
'                    TargetList_silver = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_silver, oNewRGB:=RGB(200, 200, 200))
'
'                    TargetList_gray = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_gray, oNewRGB:=RGB(150, 150, 150))
'
'                    Dim TargetList_black() As Variant
'                    TargetList_black = Array()
'                    Call fFindAndColourText(TxtRng:=oTxtRng, TargetList:=TargetList_black, oNewRGB:=RGB(0, 0, 0))

                End If
            End If
        Next oShp
    Next oSld
End Sub

Function fFindAndUnderlineText(TxtRng As Variant, TargetList() As Variant)
    Dim I As Integer
    Dim rngFound As Variant
    Dim n As Integer
    'For~Next over the TargetList
    For I = 0 To UBound(TargetList)  '~~> Loop over each term in the TargetList
        Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), MatchCase:=msoTrue)  '~~> Find the first text that matches FindWhat within the ".TextRange" got from the "Shapes.TextFrame"  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
        
        '~~~> If found
        Do While Not rngFound Is Nothing
            '~~> Set the marker so that the next find starts from here
            n = rngFound.Start + 1
            '~~> Chnage attributes
            With rngFound.Font
                '.Bold = msoTrue
                .Underline = msoTrue
                '.Italic = msoTrue
                '.Color.RGB = RGB(250, 0, 0)
                '~~> Find Next instance
                Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), After:=n, MatchCase:=msoTrue)  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
            End With
        Loop
    Next 'end of For
End Function

Function fFindAndBoldText(TxtRng As Variant, TargetList() As Variant)
    Dim I As Integer
    Dim rngFound As Variant
    Dim n As Integer
    'For~Next over the TargetList
    For I = 0 To UBound(TargetList)  '~~> Loop over each term in the TargetList
        Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), MatchCase:=msoTrue)  '~~> Find the first text that matches FindWhat within the ".TextRange" got from the "Shapes.TextFrame"  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
        
        '~~~> If found
        Do While Not rngFound Is Nothing
            '~~> Set the marker so that the next find starts from here
            n = rngFound.Start + 1
            '~~> Chnage attributes
            With rngFound.Font
                .Bold = msoTrue
                '.Underline = msoTrue
                '.Italic = msoTrue
                '.Color.RGB = RGB(250, 0, 0)
                '~~> Find Next instance
                Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), After:=n, MatchCase:=msoTrue)  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
            End With
        Loop
    Next 'end of For
End Function

Function fFindAndColourText(TxtRng As Variant, TargetList() As Variant, oNewRGB As Long) As String
    Dim I As Integer
    Dim rngFound As Variant
    Dim n As Integer
    'For~Next over the TargetList
    For I = 0 To UBound(TargetList)  '~~> Loop over each term in the TargetList
        Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), MatchCase:=msoTrue)  '~~> Find the first text that matches FindWhat within the ".TextRange" got from the "Shapes.TextFrame"  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
        
        '~~~> If found
        Do While Not rngFound Is Nothing
            '~~> Set the marker so that the next find starts from here
            n = rngFound.Start + 1
            '~~> Chnage attributes
            With rngFound.Font
                '.Bold = msoTrue
                '.Underline = msoTrue
                '.Italic = msoTrue
                .Color.RGB = oNewRGB
                '~~> Find Next instance
                Set rngFound = TxtRng.Find(FindWhat:=TargetList(I), After:=n, MatchCase:=msoTrue)  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
            End With
        Loop
    Next 'end of For
End Function
