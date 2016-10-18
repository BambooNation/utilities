# BambooNation
# v0.5
# PowerShell script to search and display AD user name
# For more details visit: https://technet.microsoft.com/en-us/library/ff730967.aspx


$strFilter = "(&(objectClass=user)(sAMAccountName=bambooUser))"

$objOU = New-Object System.DirectoryServices.DirectoryEntry("LDAP://dc=bamboo,dc=com")


$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objOU 

$objSearcher.PageSize = 1000
$objSearcher.Filter = $strFilter
$objSearcher.SearchScope = "Subtree"

#$colProplist = "name"
#foreach ($i in $colPropList){$objSearcher.PropertiesToLoad.Add($i)}

$colResults = $objSearcher.FindAll()

foreach ($objResult in $colResults)
    {
		$objItem = $objResult.Properties 
		$objItem.name		
	}