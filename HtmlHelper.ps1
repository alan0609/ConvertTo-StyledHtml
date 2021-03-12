$properties = [System.Collections.ArrayList]::New()

Enum Alignment
{
    None
    Left
    Centre
    Right
}

Class FormatProperty
{
    [string]$Label
    [string]$FormatString
    [string[]]$Class
    [string[]]$HeaderClass
    [string[]]$HeaderId
    [string]$Width
    [Alignment]$Alignment
}

Function ConvertTo-FormattedHtmlTable2
{
    [CmdletBinding()]
    Param(
        [parameter(Mandatory, ValueFromPipeline)] 
            [PSObject]$InputObject,
        [parameter()] 
            [PSObject[]]$Property,
        [parameter()]
            [string]$Title,
        #[parameter()]
        #    [CssClassRule[]]$CssRulesRowByColumnValue = $null,
        [parameter()]
            [hashtable]$HeaderDisplayName = $null

    )

    BEGIN
    {
        $script:properties = [System.Collections.ArrayList]::New()
        $html = [System.Text.StringBuilder]::New()
        $colgroupRow = [System.Text.StringBuilder]::New()
        $headerRow = [System.Text.StringBuilder]::New()

        $html.AppendLine("<table>") | Out-Null
    }
    PROCESS
    {
        # when we receive the first object we can collate the properties and construct the colgroup and header rows
        if ($script:properties.count -eq 0) { 
            
            GetPropertyDetail -InputObject $InputObject -PropertyList $Property 

            if ($script:properties.count -eq 0) { return }

            $colgroupRow, $headerRow = ConstructHeaderRow 
            $html.AppendLine($colgroupRow.ToString()) | Out-Null
            $html.AppendLine($headerRow.ToString()) | Out-Null
        }

        # now we can populate the normal data rows.  This will run for each object in the pipeline

    }
    END
    {
        $html.Append("</table>") | Out-Null
        return $html.ToString()
    }
}

Function GetPropertyDetail
{
    Param(
        [parameter(Mandatory)] 
            [PSObject]$InputObject,

        [parameter()] 
            [PSObject[]]$PropertyList
    )

    if ($PSBoundParameters.ContainsKey('Property'))
    {
        GetPropertyDetailFromPropertyList -InputObject $InputObject -PropertyList $PropertyList
        return
    }

    GetPropertyDetailFromInputObject -InputObject $InputObject

}

Function GetPropertyDetailFromPropertyList
{
    Param(
        [parameter(Mandatory)] 
            [PSObject]$InputObject,

        [parameter()] 
            [PSObject[]]$PropertyList
    )

    foreach ($item in $Property)
    {
        try
        {
            switch ($item.GetType().Name)
            {
                "string"
                {
                    $itemProperty = Get-Member -InputObject $InputObject -MemberType Properties `
                                        | Where Name -eq $item `
                                        | Select -property TypeName, Name, MemberType, Definition #, @{Label = "Width"; expression = { 0 }}, @{Label = "Alignment"; expression = { [Alignment]::None }}
                }

                default
                {
                    $itemDict = [FormatProperty]$item
                    $itemProperty = Get-Member -InputObject $InputObject -MemberType Properties `
                                        | Where Name -eq $itemDict.Label `
                                        | Select -property TypeName, Name, MemberType, Definition, @{Label = "Width"; expression = { $itemDict.Width }}, @{Label = "Alignment"; expression = { $itemDict.Alignment }}
                }
            }

            if ($itemProperty) { $script:properties.Add($itemProperty) | Out-Null }
        }
        catch
        {
        }
    }
}

Function GetPropertyDetailFromInputObject
{
    Param(
        [parameter(Mandatory)] 
            [PSObject]$InputObject
    )

    try 
    {
        if ($InputObject.GetType().Name -ne "string")
        {
            $script:properties = Get-Member -InputObject $InputObject -MemberType Properties
        }
    }
    catch
    {
    }
}

Function ConstructHeaderRow
{
    $colgroupRow = [System.Text.StringBuilder]::New()
    $headerRow = [System.Text.StringBuilder]::New()

    $colgroupRow.Append("<colgroup>") | Out-Null
    $headerRow.Append("<tr>") | Out-Null

    foreach ($item in $script:properties)
    {
        $name = $item.Name
        $type = GetTypeNameFromDefinition -Object $item

        $headerRow.Append(('<th class="{0}">{1}</th>' -f $type, $name)) | Out-Null

        $colgroupRow.Append('<col ') | Out-Null
        if ($item.GetType().Name -ne "string")
        {
            if ($item.Width)
            {
                $colgroupRow.Append(('width="{0}" ' -f $item.Width)) | Out-Null
            }

            if (($item.Alignment) -and ($item.Alignment -ne [Alignment]::None ))
            {
                $colgroupRow.Append(('align="{0}" ' -f $item.Alignment.ToString().ToLower())) | Out-Null
            }
        }
        $colgroupRow.Append('/>') | Out-Null
    }

    $headerRow.Append("</tr>") | Out-Null
    $colgroupRow.Append("</colgroup>") | Out-Null

    return $colgroupRow, $headerRow
}

Function GetTypeNameFromDefinition 
{
    Param(
        [Object]$Object
    )

    if ($Object.MemberType -eq [System.Management.Automation.PSMemberTypes]::ScriptProperty) # just return the property name
    {
         return $Object.Name
    }

    if ($Object.MemberType -eq [System.Management.Automation.PSMemberTypes]::AliasProperty) # find the underlying property
    {
         $Object = $script:properties | Where-Object Name -eq ($Object.Definition.Split(" ") | Select-Object -Last 1)
    }

    $output = $Object.Definition.Split(" ") | Select-Object -First 1

    if ($output -match "\.")
    {
        $output = $output.Split(".") | Select-Object -Last 1
    }

    return $output
}