

Sub fDocument_FindApostrophe_ColorGreen()
'https://www.mrexcel.com/forum/general-excel-discussion-other-questions/748648-vba-ms-word-change-color-text-after-apostrophe-my-loop-stuck.html
'WORD-VBA
  With ActiveDocument.Content.Find
    .ClearFormatting
    .Text = "'*[^13]"
    .Replacement.ClearFormatting
    .Replacement.Text = ""
    .Replacement.Font.Color = wdColorGreen
    .Format = True
    .Forward = True
    .Wrap = wdFindContinue
    .MatchCase = False
    .MatchWholeWord = False
    .MatchAllWordForms = False
    .MatchSoundsLike = False
    .MatchWildcards = True
    .Execute Replace:=wdReplaceAll
  End With
End Sub

Sub fSelection_FindApostrophe_ColorGreen()
'WORD-VBA
'https://www.mrexcel.com/forum/general-excel-discussion-other-questions/748648-vba-ms-word-change-color-text-after-apostrophe-my-loop-stuck.html
  With Selection.Find
    .ClearFormatting
    .Text = "'*[^13]"
    .Replacement.ClearFormatting
    .Replacement.Text = ""
    .Replacement.Font.Color = wdColorGreen
    .Format = True
    .Forward = True
    .Wrap = wdFindStop
    .MatchCase = False
    .MatchWholeWord = False
    .MatchAllWordForms = False
    .MatchSoundsLike = False
    .MatchWildcards = True
    .Execute Replace:=wdReplaceAll
  End With
End Sub


'Sub fDocument_FindText_Color()
'  With ActiveDocument.Content.Find
'    .ClearFormatting
'    .Text = "'*[^13]"
'    .Replacement.ClearFormatting
'    .Replacement.Text = ""
'    .Replacement.Font.Color = wdColorGreen
'    .Format = True
'    .Forward = True
'    .Wrap = wdFindContinue
'    .MatchCase = False
'    .MatchWholeWord = False
'    .MatchAllWordForms = False
'    .MatchSoundsLike = False
'    .MatchWildcards = True
'    .Execute Replace:=wdReplaceAll
'  End With
'End Sub
'
'
'Sub fSelection_FindText_Color()
'  With Selection.Find
'    .ClearFormatting
'    .Text = "'*[^13]"
'    .Replacement.ClearFormatting
'    .Replacement.Text = ""
'    .Replacement.Font.Color = wdColorGreen
'    .Format = True
'    .Forward = True
'    .Wrap = wdFindStop
'    .MatchCase = False
'    .MatchWholeWord = False
'    .MatchAllWordForms = False
'    .MatchSoundsLike = False
'    .MatchWildcards = True
'    .Execute Replace:=wdReplaceAll
'  End With
'End Sub
'
'


