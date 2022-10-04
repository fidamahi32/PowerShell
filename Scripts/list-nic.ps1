﻿<#
.SYNOPSIS
	Lists NIC details
.DESCRIPTION
	This PowerShell script lists the details of the installed network interfaces.
.EXAMPLE
	PS> ./list-nic
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	Get-WmiObject -Class Win32_NetworkAdapterConfiguration
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}