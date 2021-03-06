﻿function Format-Silly {
    param (
        [string] $String,
        [switch] $SetClipboard
        
    )
    $Combining = 0x0300 .. 0x036F | ForEach-Object { [char]$_ } | Sort-Object { Get-Random }

    $i = 0

    if ($SetClipboard) {
        -join ($String.ToCharArray() | ForEach-Object { $_ -replace '[A-Za-z]', "`$0$($Combining[$i++])" }) | Set-Clipboard
    } else {
        -join ($String.ToCharArray() | ForEach-Object { $_ -replace '[A-Za-z]', "`$0$($Combining[$i++])" })
    }
}

function Get-Zalgo {
    param(
        [ValidateRange(1,9999)]
        [int] $Number
    )
    
    process {
        -join $(1..$Number | ForEach-Object {
            [char](0x0300 .. 0x036F | Get-Random)
        })
    }
}
function Format-Zalgo {
    param (
        [string] $String,
        [switch] $SetClipboard
    )
    
    process {
        if ($SetClipboard) {
            -join $($String.ToCharArray() | ForEach-Object {
                -join $_,(Get-Zalgo -Number 50)
            }) | Set-Clipboard
        } else {
            -join $($String.ToCharArray() | ForEach-Object {
                -join $_,(Get-Zalgo -Number 50)
            })
        }
    }
}