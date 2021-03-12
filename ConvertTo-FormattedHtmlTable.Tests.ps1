
BeforeAll { 

    . ./HtmlHelper.ps1

    $scalar = 3
    $scalarArray = @(3,4,5)

    $string = "Hello"
    $stringArray = @("hello","goodbye")
    
    $date = Get-Date
    
    $hash = @{
        name = [string]"tim"
        id = [int]2
        count = [int]4
    }
    $hashArray = @($hash, $hash)
    
    $objectArray = Get-Process | Select-Object -First 3
    $object = $objectArray[0]
    
    $customObject = New-Object -Property $hash -TypeName psobject
    $customObjectArray = @($customObject, $customObject)
    $customObjectArrayList = [System.Collections.ArrayList]::New()
    $customObjectArrayList.Add($customObject)
    $customObjectArrayList.Add($customObject)

    $MixedObjectArrayList = [System.Collections.ArrayList]::New()
    $MixedObjectArrayList.Add($customObject)
    $MixedObjectArrayList.Add($object)
    
    Function RemoveWhiteSpace
    {
        param (
            [parameter(ValueFromPipeline)]
            [string]$InputString
        )

        $output = $InputString -replace '>\s*<', '><'
        return $output
    }

    Function RemoveNewline
    {
        param (
            [parameter(ValueFromPipeline)]
            [string]$InputString
        )

        $output = $InputString -replace '>`\n*<', ''
        $output = $output -replace '>`\r*<', ''
        return $output
    }

    Function Clean
    {
        param (
            [parameter(ValueFromPipeline)]
            [string]$InputString
        )

        $output = $InputString | RemoveWhitespace | RemoveNewline
        return $output
    }

    Function TestByInoutObject_EmptyTable_ExpectedResult
    {
    return @'
<table>
</table>
'@
    }

    Function TestByInoutObject_Array_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="int">Count</th>
        <th class="bool">IsFixedSize</th>
        <th class="bool">IsReadOnly</th>
        <th class="bool">IsSynchronized</th>
        <th class="int">Length</th>
        <th class="long">LongLength</th>
        <th class="int">Rank</th>
        <th class="object">SyncRoot</th>
    </tr>
</table>
'@
    }
    
    Function TestByInoutObject_Date_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="DisplayHintType">DisplayHint</th>
        <th class="datetime">Date</th>
        <th class="int">Day</th>
        <th class="DayOfWeek">DayOfWeek</th>
        <th class="int">DayOfYear</th>
        <th class="int">Hour</th>
        <th class="DateTimeKind">Kind</th>
        <th class="int">Millisecond</th>
        <th class="int">Minute</th>
        <th class="int">Month</th>
        <th class="int">Second</th>
        <th class="long">Ticks</th>
        <th class="timespan">TimeOfDay</th>
        <th class="int">Year</th>
        <th class="DateTime">DateTime</th>
    </tr>
</table>
'@
    }
    
    Function TestByInoutObject_Hash_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="int">Count</th>
        <th class="bool">IsFixedSize</th>
        <th class="bool">IsReadOnly</th>
        <th class="bool">IsSynchronized</th>
        <th class="ICollection">Keys</th>
        <th class="object">SyncRoot</th>
        <th class="ICollection">Values</th>
    </tr>
</table>
'@
    }
    
    Function TestByInoutObject_Object_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="int">Handles</th>
        <th class="string">Name</th>
        <th class="long">NPM</th>
        <th class="long">PM</th>
        <th class="int">SI</th>
        <th class="long">VM</th>
        <th class="long">WS</th>
        <th class="string">__NounName</th>
        <th class="int">BasePriority</th>
        <th class="IContainer">Container</th>
        <th class="bool">EnableRaisingEvents</th>
        <th class="int">ExitCode</th>
        <th class="datetime">ExitTime</th>
        <th class="IntPtr">Handle</th>
        <th class="int">HandleCount</th>
        <th class="bool">HasExited</th>
        <th class="int">Id</th>
        <th class="string">MachineName</th>
        <th class="ProcessModule">MainModule</th>
        <th class="IntPtr">MainWindowHandle</th>
        <th class="string">MainWindowTitle</th>
        <th class="IntPtr">MaxWorkingSet</th>
        <th class="IntPtr">MinWorkingSet</th>
        <th class="ProcessModuleCollection">Modules</th>
        <th class="int">NonpagedSystemMemorySize</th>
        <th class="long">NonpagedSystemMemorySize64</th>
        <th class="int">PagedMemorySize</th>
        <th class="long">PagedMemorySize64</th>
        <th class="int">PagedSystemMemorySize</th>
        <th class="long">PagedSystemMemorySize64</th>
        <th class="int">PeakPagedMemorySize</th>
        <th class="long">PeakPagedMemorySize64</th>
        <th class="int">PeakVirtualMemorySize</th>
        <th class="long">PeakVirtualMemorySize64</th>
        <th class="int">PeakWorkingSet</th>
        <th class="long">PeakWorkingSet64</th>
        <th class="bool">PriorityBoostEnabled</th>
        <th class="ProcessPriorityClass">PriorityClass</th>
        <th class="int">PrivateMemorySize</th>
        <th class="long">PrivateMemorySize64</th>
        <th class="timespan">PrivilegedProcessorTime</th>
        <th class="string">ProcessName</th>
        <th class="IntPtr">ProcessorAffinity</th>
        <th class="bool">Responding</th>
        <th class="SafeProcessHandle">SafeHandle</th>
        <th class="int">SessionId</th>
        <th class="ISite">Site</th>
        <th class="StreamReader">StandardError</th>
        <th class="StreamWriter">StandardInput</th>
        <th class="StreamReader">StandardOutput</th>
        <th class="ProcessStartInfo">StartInfo</th>
        <th class="datetime">StartTime</th>
        <th class="ISynchronizeInvoke">SynchronizingObject</th>
        <th class="ProcessThreadCollection">Threads</th>
        <th class="timespan">TotalProcessorTime</th>
        <th class="timespan">UserProcessorTime</th>
        <th class="int">VirtualMemorySize</th>
        <th class="long">VirtualMemorySize64</th>
        <th class="int">WorkingSet</th>
        <th class="long">WorkingSet64</th>
        <th class="Company">Company</th>
        <th class="CPU">CPU</th>
        <th class="Description">Description</th>
        <th class="FileVersion">FileVersion</th>
        <th class="Path">Path</th>
        <th class="Product">Product</th>
        <th class="ProductVersion">ProductVersion</th>
    </tr>
</table>
'@
    }

    Function TestByInoutObject_CustomObject_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="int">count</th>
        <th class="int">id</th>
        <th class="string">name</th>
    </tr>
</table>
'@
    }

    Function TestByInoutObject_CustomObjectArrayList_ExpectedResult
    {
        return @'
<table>
    <colgroup>
        <col />
        <col />
        <col />
        <col />
        <col />
        <col />
    </colgroup>
    <tr>
        <th class="int">Capacity</th>
        <th class="int">Count</th>
        <th class="bool">IsFixedSize</th>
        <th class="bool">IsReadOnly</th>
        <th class="bool">IsSynchronized</th>
        <th class="object">SyncRoot</th>
    </tr>
</table>
'@
    }
    
}

Describe 'TestByInputObject' {
    
    Context 'Scalar' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $scalar | Clean) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($scalar | ConvertTo-FormattedHtmlTable2 | Clean) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult | Clean)
        }
    }

    Context 'ScalarArray' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $scalarArray | Clean) | Should -Be (TestByInoutObject_Array_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($scalarArray | ConvertTo-FormattedHtmlTable2) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult)
        }
    }

    Context 'String' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $string | Clean) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($string | ConvertTo-FormattedHtmlTable2) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult)
        }
    }

    Context 'StringArray' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $stringArray | Clean) | Should -Be (TestByInoutObject_Array_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($stringArray | ConvertTo-FormattedHtmlTable2) | Should -Be (TestByInoutObject_EmptyTable_ExpectedResult)
        }
    }

    Context 'Date' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $date | Clean) | Should -Be (TestByInoutObject_Date_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($date | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_Date_ExpectedResult | Clean)
        }
    }

    Context 'Hash' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $hash | Clean) | Should -Be (TestByInoutObject_Hash_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($hash | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_Hash_ExpectedResult | Clean)
        }
    }

    Context 'HashArray' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $hashArray | Clean) | Should -Be (TestByInoutObject_Array_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($hashArray | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_Hash_ExpectedResult | Clean)
        }
    }

    Context 'Object' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $object | Clean) | Should -Be (TestByInoutObject_Object_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($object | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_Object_ExpectedResult | Clean)
        }
    }

    Context 'ObjectArray' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $objectArray | Clean) | Should -Be (TestByInoutObject_Array_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($objectArray | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_Object_ExpectedResult | Clean)
        }
    }

    Context 'CustomObject' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $customObject | Clean) | Should -Be (TestByInoutObject_CustomObject_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($customObject | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_CustomObject_ExpectedResult | Clean)
        }
    }

    Context 'CustomObjectArray' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArray | Clean) | Should -Be (TestByInoutObject_Array_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($customObjectArray | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_CustomObject_ExpectedResult | Clean)
        }
    }

    Context 'CustomObjectArrayList' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArrayList | Clean) | Should -Be (TestByInoutObject_CustomObjectArrayList_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($customObjectArrayList | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_CustomObject_ExpectedResult | Clean)
        }
    }

    Context 'MixedObjectArrayList' {
        It 'Returns the correct response when only the input object is passed as a parameter' {
            (ConvertTo-FormattedHtmlTable2 -InputObject $mixedObjectArrayList | Clean) | Should -Be (TestByInoutObject_CustomObjectArrayList_ExpectedResult | Clean)
        }

        It 'Returns the correct response when only the input object is passed in the pipeline' {
            ($mixedObjectArrayList | ConvertTo-FormattedHtmlTable2) | Clean | Should -Be (TestByInoutObject_CustomObject_ExpectedResult | Clean)
        }
    }
}
