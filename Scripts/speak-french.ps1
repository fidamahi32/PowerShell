<#
.SYNOPSIS
	speak-french.ps1 [<text>]
.DESCRIPTION
	Speaks the given text with a French text-to-speech (TTS) voice
.EXAMPLE
	PS> .\speak-french.ps1 Salut
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

param([string]$Text = "")

try {
	if ($Text -eq "") { $Text = read-host "Enter the text to speak" }

	$Voice = new-object -ComObject SAPI.SPVoice
	$Voices = $Voice.GetVoices()
	foreach ($OtherVoice in $Voices) {
		$Description = $OtherVoice.GetDescription()
		if ($Description -notlike "*- French*") { continue }
		$Voice.Voice = $OtherVoice
		[void]$Voice.Speak($Text)
		exit 0
	}
	write-error "Sorry, no French text-to-speech (TTS) voice found"
	exit 1
} catch {
	write-error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}