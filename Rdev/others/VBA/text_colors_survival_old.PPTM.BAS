''Option Explicit
'
'Sub text_colors_survival_old() 'codes for changing text colors of certain words within a Powerpoint file. (KNHIS feature engineering 160808 future prediction 161209.pptm)
'    Dim sld As Slide
'    Dim shp As Shape
'    Dim TxtRng As TextRange, rngFound As TextRange
'    Dim I As Long, n As Long
'    'Dim TargetList
'    'Dim lst() As New List(Of String())
'    'Dim CollectionOfObject As New Microsoft.VisualBasic.Collection()
'
'    '~~>  Array of terms to search for
'    TargetList_Underline = Array()
'    '.Color.RGB = RGB(250, 0, 0)
'
'    TargetList_Bold = Array()
'    '.Color.RGB = RGB(250, 0, 0)
'
'    TargetList_red = Array()
'    '.Color.RGB = RGB(250, 0, 0)
'    TargetList_maroon = Array("date")
'    '.Color.RGB = RGB(150, 0, 0)
'
'    TargetList_orangered = Array()
'    '.Color.RGB = RGB(250, 70, 0)
'    'TargetList_orange = Array()
'    '.Color.RGB = RGB(250, 150, 0)
'    TargetList_gold = Array()
'    '.Color.RGB = RGB(250, 200, 0)
'
'    'TargetList_yellow = Array()
'    '.Color.RGB = RGB(250, 250, 0)
'    'TargetList_olive = Array()
'    '.Color.RGB = RGB(150, 150, 0)
'
'    TargetList_lime = Array("#", ".", "$", "replicate", "lapply", "map", "function", "source", "caution")
'    '.Color.RGB = RGB(0, 250, 0)
'    TargetList_green = Array()
'    '.Color.RGB = RGB(0, 150, 0)
'
'    TargetList_cyan = Array("time", "event", "strata", "Exposed", "Case", "Ctrl", "diff")
'    '.Color.RGB = RGB(0, 250, 250)
'    'TargetList_teal = Array()
'    '.Color.RGB = RGB(0, 150, 150)
'
'    TargetList_blue = Array()
'    '.Color.RGB = RGB(0, 0, 250)
'    'TargetList_navy = Array(")
'    '.Color.RGB = RGB(0, 0, 150)
'
'    TargetList_magenta = Array(".gt", "Match", "caliper", "PSMatch", "IVMatch", "MahalMatch", "1_2", "1_3", "1_5", "1_10")
'    '.Color.RGB = RGB(250, 0, 250)
'    TargetList_purple = Array()
'    '.Color.RGB = RGB(150, 0, 150)
'
'    'TargetList_silver = Array()
'    '.Color.RGB = RGB(200, 200, 200)
'    'TargetList_gray = Array()
'    '.Color.RGB = RGB(150, 150, 150)
'    TargetList_black = Array()
'    '.Color.RGB = RGB(0, 0, 0)
'
'    For Each sld In Application.ActivePresentation.Slides  '~~> Loop through each Slides
'        For Each shp In sld.Shapes  '~~> Loop through each "Shapes" inside this "(Application.)ActivePresentation.Slides"
'            'If oShp.Type = msoGroup Then  '~~> Check the ".Type" of this "Shapes"??? Not necessary???
'            If shp.HasTextFrame Then  '~~> Check if each of the "Shapes" has TextFrame???
'                'If oShp.TextFrame.HasText Then  '~~> Check if each of the "Shapes.TextFrame" has Text??? Not necessary???
'                Set TxtRng = shp.TextFrame.TextRange  '~~> Get ".TextRange" from the "Shapes.TextFrame"
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_Underline)  '~~> Loop over each term in the TargetList
'                    Set rngFound = TxtRng.Find(FindWhat:=TargetList_Underline(I))  '~~> Find the first text that matches FindWhat within the ".TextRange" got from the "Shapes.TextFrame"  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            .Underline = msoTrue
'                            '.Italic = msoTrue
'                            '.Color.RGB = RGB(250, 0, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(FindWhat:=TargetList_Underline(I), After:=n, MatchCase:=msoTrue)  '# Find( FindWhat, After, MatchCase, WholeWords ) '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-find-method-powerpoint
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_Bold)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_Bold(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            .Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            '.Color.RGB = RGB(250, 0, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_Bold(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_red)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_red(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(250, 0, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_red(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_maroon)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_maroon(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(150, 0, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_maroon(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_orangered)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_orangered(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(250, 70, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_orangered(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_gold)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_gold(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(250, 200, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_gold(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_green)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_green(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(0, 150, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_green(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_cyan)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_cyan(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(0, 250, 250)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_cyan(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_blue)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_blue(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(0, 0, 250)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_blue(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_magenta)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_magenta(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(250, 0, 250)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_magenta(I), n)
'                        End With
'                    Loop
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_purple)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_purple(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(150, 0, 150)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_purple(I), n)
'                        End With
'                    Loop 'end of Do While
'                Next 'end of For
'
'                'For~Next over the TargetList
'                For I = 0 To UBound(TargetList_black)
'                    '~~> Find the text
'                    Set rngFound = TxtRng.Find(TargetList_black(I))
'
'                    '~~~> If found
'                    Do While Not rngFound Is Nothing
'                        '~~> Set the marker so that the next find starts from here
'                        n = rngFound.Start + 1
'                        '~~> Chnage attributes
'                        With rngFound.Font
'                            '.Bold = msoTrue
'                            '.Underline = msoTrue
'                            '.Italic = msoTrue
'                            .Color.RGB = RGB(0, 0, 0)
'                            '~~> Find Next instance
'                            Set rngFound = TxtRng.Find(TargetList_black(I), n)
'                        End With
'                    Loop 'end of Do While
'                Next 'end of For
'
'            End If
'        Next
'    Next
'End Sub
'
'
'
'
'
'
'
'
