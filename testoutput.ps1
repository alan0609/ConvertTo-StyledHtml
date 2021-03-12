[CmdletBinding()]
param (
    [Parameter()]
    [switch]$normal = $false,

    [Parameter()]
    [switch]$hashprops = $false,

    [Parameter()]
    [switch]$props = $false
)

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
$customObjectArray = @($object, $object)
$customObjectArrayList = [System.Collections.ArrayList]::New()
$customObjectArrayList.Add($object)
$customObjectArrayList.Add($object)

function TestNormal
{

    "scalar"
    ConvertTo-Html -InputObject $scalar -fragment
    ""

    "scalar piped"
    $scalar | ConvertTo-Html -fragment
    ""

    "scalar array"
    ConvertTo-Html -InputObject $scalarArray -fragment
    ""

    "scalar array piped"
    $scalarArray | ConvertTo-Html -fragment
    ""

    "string"
    ConvertTo-Html -InputObject $string -fragment
    ""

    "string piped"
    $string | ConvertTo-Html -fragment
    ""

    "string array"
    ConvertTo-Html -InputObject $stringArray -fragment
    ""

    "string array piped"
    $stringArray | ConvertTo-Html -fragment
    ""

    "date"
    ConvertTo-Html -InputObject $date -fragment
    ""

    "date piped"
    $date | ConvertTo-Html -fragment
    ""

    "hash"
    ConvertTo-Html -InputObject $hash -fragment
    ""

    "hash piped"
    $hash | ConvertTo-Html -fragment
    ""

    "hash array"
    ConvertTo-Html -InputObject $hashArray -fragment
    ""

    "hash array piped"
    $hashArray | ConvertTo-Html -fragment
    ""

    "object"
    ConvertTo-Html -InputObject $object -fragment
    ""

    "object piped"
    $object | ConvertTo-Html -fragment
    ""

    "object array"
    ConvertTo-Html -InputObject $objectArray -fragment
    ""

    "object array piped"
    $objectArray | ConvertTo-Html -fragment
    ""

    "custom object"
    ConvertTo-Html -InputObject $customObject -fragment
    ""

    "custom object piped"
    $customObject | ConvertTo-Html -fragment
    ""

    "custom object array"
    ConvertTo-Html -InputObject $customObjectArray -fragment
    ""

    "custom object array piped"
    $customObjectArray | ConvertTo-Html -fragment
    ""

    "custom object array list"
    ConvertTo-Html -InputObject $customObjectArrayList -fragment
    ""

    "custom object array list piped"
    $customObjectArrayList | ConvertTo-Html -fragment
    ""
}

function TestNormalProps
{

    "scalar"
    ConvertTo-Html -InputObject $scalar -fragment -Property cat
    ""

    "scalar piped"
    $scalar | ConvertTo-Html -fragment -Property cat
    ""

    "scalar array"
    ConvertTo-Html -InputObject $scalarArray -fragment -Property cat, count, rank
    ""

    "scalar array piped"
    $scalarArray | ConvertTo-Html -fragment -Property cat, count, rank
    ""

    "string"
    ConvertTo-Html -InputObject $string -fragment -Property cat, count, rank
    ""

    "string piped"
    $string | ConvertTo-Html -fragment -Property cat, count, rank
    ""

    "string array"
    ConvertTo-Html -InputObject $stringArray -fragment -Property cat, count, rank
    ""

    "string array piped"
    $stringArray | ConvertTo-Html -fragment -Property cat, count, rank
    ""

    "date"
    ConvertTo-Html -InputObject $date -fragment -Property cat, Day, DayOfWeek, DateTime
    ""

    "date piped"
    $date | ConvertTo-Html -fragment -Property cat, Day, DayOfWeek, DateTime
    ""

    "hash"
    ConvertTo-Html -InputObject $hash -fragment -Property cat, count, keys
    ""

    "hash piped"
    $hash | ConvertTo-Html -fragment -Property cat, count, keys
    ""

    "hash array"
    ConvertTo-Html -InputObject $hashArray -fragment -Property cat, count, keys
    ""

    "hash array piped"
    $hashArray | ConvertTo-Html -fragment -Property cat, count, keys
    ""

    "object"
    ConvertTo-Html -InputObject $object -fragment -Property cat, name, id
    ""

    "object piped"
    $object | ConvertTo-Html -fragment -Property cat, name, id, count
    ""

    "object array"
    ConvertTo-Html -InputObject $objectArray -fragment -Property cat, name, id, count
    ""

    "object array piped"
    $objectArray | ConvertTo-Html -fragment -Property cat, name, id, count
    ""

    "custom object"
    ConvertTo-Html -InputObject $customObject -fragment -Property cat, name, id, count
    ""

    "custom object piped"
    $customObject | ConvertTo-Html -fragment -Property cat, name, id, count
    ""

    "custom object array"
    ConvertTo-Html -InputObject $customObjectArray -fragment -Property cat, name, id, count
    ""

    "custom object array piped"
    $customObjectArray | ConvertTo-Html -fragment -Property cat, name, id, count
    ""

    "custom object array list"
    ConvertTo-Html -InputObject $customObjectArrayList -fragment -Property cat, name, id, count
    ""

    "custom object array list piped"
    $customObjectArrayList | ConvertTo-Html -fragment -Property cat, name, id, count
    ""
}

function TestMine
{
    "scalar"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalar
    ""

    "scalar piped"
    $scalar | ConvertTo-FormattedHtmlTable2
    ""

    "scalar array"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalarArray
    ""

    "scalar array piped"
    $scalarArray | ConvertTo-FormattedHtmlTable2
    ""

    "string"
    ConvertTo-FormattedHtmlTable2 -InputObject $string
    ""

    "string piped"
    $string | ConvertTo-FormattedHtmlTable2
    ""

    "string array"
    ConvertTo-FormattedHtmlTable2 -InputObject $stringArray
    ""

    "string array piped"
    $stringArray | ConvertTo-FormattedHtmlTable2
    ""

    "date"
    ConvertTo-FormattedHtmlTable2 -InputObject $date
    ""

    "date piped"
    $date | ConvertTo-FormattedHtmlTable2
    ""

    "hash"
    ConvertTo-FormattedHtmlTable2 -InputObject $hash
    ""

    "hash piped"
    $hash | ConvertTo-FormattedHtmlTable2
    ""

    "hash array"
    ConvertTo-FormattedHtmlTable2 -InputObject $hashArray
    ""

    "hash array piped"
    $hashArray | ConvertTo-FormattedHtmlTable2
    ""

    "object"
    ConvertTo-FormattedHtmlTable2 -InputObject $object
    ""

    "object piped"
    $object | ConvertTo-FormattedHtmlTable2
    ""

    "object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $objectArray
    ""

    "object array piped"
    $objectArray | ConvertTo-FormattedHtmlTable2
    ""

    "custom object"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObject
    ""

    "custom object piped"
    $customObject | ConvertTo-FormattedHtmlTable2
    ""

    "custom object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArray
    ""

    "custom object array piped"
    $customObjectArray | ConvertTo-FormattedHtmlTable2
    ""

    "custom object array list"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArrayList
    ""

    "custom object array list piped"
    $customObjectArrayList | ConvertTo-FormattedHtmlTable2
    ""
}


function TestMineProps
{
    "scalar"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalar -Property cat
    ""

    "scalar piped"
    $scalar | ConvertTo-FormattedHtmlTable2 -Property cat
    ""

    "scalar array"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalarArray -Property cat, count, rank
    ""

    "scalar array piped"
    $scalarArray | ConvertTo-FormattedHtmlTable2 -Property cat, count, rank
    ""

    "string"
    ConvertTo-FormattedHtmlTable2 -InputObject $string -Property cat, count, rank
    ""

    "string piped"
    $string | ConvertTo-FormattedHtmlTable2 -Property cat, count, rank
    ""

    "string array"
    ConvertTo-FormattedHtmlTable2 -InputObject $stringArray -Property cat, count, rank
    ""

    "string array piped"
    $stringArray | ConvertTo-FormattedHtmlTable2 -Property cat, count, rank
    ""

    "date"
    ConvertTo-FormattedHtmlTable2 -InputObject $date -Property cat, Day, DayOfWeek, DateTime
    ""

    "date piped"
    $date | ConvertTo-FormattedHtmlTable2 -Property cat, Day, DayOfWeek, DateTime
    ""

    "hash"
    ConvertTo-FormattedHtmlTable2 -InputObject $hash -Property cat, count, keys
    ""

    "hash piped"
    $hash | ConvertTo-FormattedHtmlTable2 -Property cat, count, keys
    ""

    "hash array"
    ConvertTo-FormattedHtmlTable2 -InputObject $hashArray -Property cat, count, keys
    ""

    "hash array piped"
    $hashArray | ConvertTo-FormattedHtmlTable2 -Property cat, count, keys
    ""

    "object"
    ConvertTo-FormattedHtmlTable2 -InputObject $object -Property cat, name, id
    ""

    "object piped"
    $object | ConvertTo-FormattedHtmlTable2 -Property cat, name, id
    ""

    "object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $objectArray -Property cat, name, id, count
    ""

    "object array piped"
    $objectArray | ConvertTo-FormattedHtmlTable2 -Property cat, name, id, count
    ""

    "custom object"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObject -Property cat, name, id, count
    ""

    "custom object piped"
    $customObject | ConvertTo-FormattedHtmlTable2 -Property cat, name, id, count
    ""

    "custom object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArray -Property cat, name, id, count
    ""

    "custom object array piped"
    $customObjectArray | ConvertTo-FormattedHtmlTable2 -Property cat, name, id, count
    ""

    "custom object array list"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArrayList -Property cat, name, id, count
    ""

    "custom object array list piped"
    $customObjectArrayList | ConvertTo-FormattedHtmlTable2 -Property cat, name, id, count
    ""
}

function TestMineHash
{
    $hcat = @{ Label = "Cat"; Alignment = "Right"}
    $hcount = @{ Label = "Count"; Width = "100px"; Alignment = "Right" }
    $hrank = @{ Label = "Rank" }
    $hid = @{ Label = "Id"; Width = "50px" }
    $hDay = @{ Label = "Day" }
    $hDayOfWeek = @{ Label = "DayOfWeek" }
    $hDateTime = @{ Label = "DateTime" }
    $hKeys = @{ Label = "Keys" }

    "scalar"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalar -Property $hcat
    ""

    "scalar piped"
    $scalar | ConvertTo-FormattedHtmlTable2 -Property $hcat
    ""

    "scalar array"
    ConvertTo-FormattedHtmlTable2 -InputObject $scalarArray -Property $hcat, $hcount, $hrank
    ""

    "scalar array piped"
    $scalarArray | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hcount, $hrank
    ""

    "string"
    ConvertTo-FormattedHtmlTable2 -InputObject $string -Property $hcat, $hcount, $hrank
    ""

    "string piped"
    $string | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hcount, $hrank
    ""

    "string array"
    ConvertTo-FormattedHtmlTable2 -InputObject $stringArray -Property $hcat, $hcount, $hrank
    ""

    "string array piped"
    $stringArray | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hcount, $hrank
    ""

    "date"
    ConvertTo-FormattedHtmlTable2 -InputObject $date -Property $hcat, $hDay, $hDayOfWeek, $hDateTime
    ""

    "date piped"
    $date | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hDay, $hDayOfWeek, $hDateTime
    ""

    "hash"
    ConvertTo-FormattedHtmlTable2 -InputObject $hash -Property $hcat, $hcount, $hkeys
    ""

    "hash piped"
    $hash | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hcount, $hkeys
    ""

    "hash array"
    ConvertTo-FormattedHtmlTable2 -InputObject $hashArray -Property $hcat, $hcount, $hkeys
    ""

    "hash array piped"
    $hashArray | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hcount, $hkeys
    ""

    "object"
    ConvertTo-FormattedHtmlTable2 -InputObject $object -Property $hcat, $hname, $hid
    ""

    "object piped"
    $object | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hname, $hid
    ""

    "object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $objectArray -Property $hcat, $hname, $hid, $hcount
    ""

    "object array piped"
    $objectArray | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObject -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object piped"
    $customObject | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object array"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArray -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object array piped"
    $customObjectArray | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object array list"
    ConvertTo-FormattedHtmlTable2 -InputObject $customObjectArrayList -Property $hcat, $hname, $hid, $hcount
    ""

    "custom object array list piped"
    $customObjectArrayList | ConvertTo-FormattedHtmlTable2 -Property $hcat, $hname, $hid, $hcount
    ""
}


if ($normal)
{
    if ($props)
    {
        TestNormalProps
    }
    else
    {
        TestNormal
    }
}
else
{
    if ($props)
    {
        TestMineProps
    }
    elseif ($hashprops)
    {
        TestMineHash
    }
    else
    {
        TestMine
    }
}

