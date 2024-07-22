'http://skp.mvps.org/pptxp006.htm
Option Explicit

Sub RecolourShapes()
    Dim oSld As Slide
    Dim oShp As Shape
    Dim II As Integer
    For Each oSld In ActivePresentation.Slides  '~~> Loop through each Slides
        For Each oShp In oSld.Shapes  '~~> Loop through each "Shapes" inside this "(Application.)ActivePresentation.Slides"
            If oShp.Type = msoGroup Then  '~~> Check the ".Type" of this "Shapes"??? Not necessary???
                For II = 1 To oShp.GroupItems.Count
                    Call FindAndReColourText(oShp.GroupItems(II), _
                    RGB(100, 100, 100), RGB(255, 0, 255))
                    Call FindAndReColourFill(oShp.GroupItems(II), _
                    RGB(255, 255, 255), RGB(255, 0, 255))
                    Call FindAndReColourBorder(oShp.GroupItems(II), _
                    RGB(100, 100, 100), RGB(255, 0, 255))
                Next II
            Else
                Call FindAndReColourText(oShp, _
                RGB(100, 100, 100), RGB(255, 0, 255))
                Call FindAndReColourFill(oShp, _
                RGB(255, 255, 255), RGB(255, 0, 255))
                Call FindAndReColourBorder(oShp, _
                RGB(100, 100, 100), RGB(255, 0, 255))
            End If
        Next oShp
    Next oSld
End Sub

Function FindAndReColourText(oShp As Shape, oRGB As Long, oNewRGB As Long)
    Dim I As Integer
    Dim oTxtRng As TextRange
    On Error Resume Next
    If oShp.HasTextFrame Then  '~~> Check if each of the "Shapes" has TextFrame???
        If oShp.TextFrame.HasText Then  '~~> Check if each of the "Shapes.TextFrame" has Text??? Not necessary???
            Set oTxtRng = oShp.TextFrame.TextRange  '~~> Get ".TextRange" from the "Shapes.TextFrame"
            For I = 1 To oTxtRng.Runs.Count  '~~> Loop over the ".TextRange" got from the "Shapes.TextFrame"  'Runs( Start, Length ) If both Start and Length are omitted, the returned range starts with the first run and ends with the last paragraph in the specified range. '# https://msdn.microsoft.com/VBA/PowerPoint-VBA/articles/textrange-runs-method-powerpoint
                With oTxtRng.Runs(I).Font.Color  '~~> With ".Font.Color" of each iteration in ".TextRange" got from the "Shapes.TextFrame"
                    If .Type = msoColorTypeRGB Then
                        If .RGB = oRGB Then  '~~> If .RBG - oRGB Then change to oNewRGB
                            .RGB = oNewRGB
                        End If
                    End If
                End With
            Next I
        End If
    End If
End Function

Function FindAndReColourFill(oShp As Shape, oRGB As Long, oNewRGB As Long)
    On Error Resume Next
    If oShp.Fill.Visible Then
        If oShp.Fill.ForeColor.RGB = oRGB Then
            oShp.Fill.ForeColor.RGB = oNewRGB
        End If
    End If
End Function

Function FindAndReColourBorder(oShp As Shape, oRGB As Long, oNewRGB As Long)
    On Error Resume Next
    If oShp.Line.Visible Then
        If oShp.Line.ForeColor.RGB = oRGB Then
            oShp.Line.ForeColor.RGB = oNewRGB
        End If
    End If
End Function



