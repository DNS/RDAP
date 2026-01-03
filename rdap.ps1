
if ($args) {
	$bulk_domain = $args
} else {
	$bulk_domain = $input | % { $_ }
}


if (-not $bulk_domain) {
	Write-Output 'rdap.ps1 — Check domain expiration date using RDAP'
	Write-Output 'Usage:'
	Write-Output '	rdap abc.com xyz.com'
	Write-Output "	'abc.com', 'xyz.com' | rdap"
	exit
}


foreach ($domain in $bulk_domain) {
	$a = irm "https://www.rdap.net/domain/$domain"
	
	$a.events | % {
		if ($_.eventAction -match 'regist') {
			$registration = $_.eventDate.ToString('yyyy-MM-dd')
		}
		
		if ($_.eventAction -match 'expir') {
			$expiration = $_.eventDate.ToString('yyyy-MM-dd')
		}
		
	}
	
	$b = irm "https://hypestat.com/api/E9asC1KOutzPrlALHn34X/$domain"
	$hypestat = $b.data.rank.hype_rank

	
	[PSCustomObject] @{
		domain = $domain
		registration = $registration
		expiration = $expiration
		popularity = $hypestat
	}

}


