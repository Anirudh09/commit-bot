#Set this in the task scheduler for Windows

# Set a random number between 1 and 365 (for the days of the year)
$randomNumber = Get-Random -Minimum 0 -Maximum 2

Write-Host "The random number is: $randomNumber"

# If the random day matches the current day, run the script
if ($randomNumber -eq 1) {

	# Set commit message with current date
	$info = "Commit: $(Get-Date)"

	# Append the commit info to the output.txt file
	$info | Out-File -Append -FilePath "Path\to\output.txt"

	# Output the commit info to the console
	Write-Host $info
	Write-Host ""
	
	$gitRepoPath = "Path\to\commit-bot"
    Set-Location -Path $gitRepoPath

	# Detect current branch (main, master, etc.)
	$branch = git rev-parse --abbrev-ref HEAD

	# Stage the file and commit changes
	git add output.txt
	git commit -m $info

	# Push the changes to the remote repository
	git push origin $branch

	Write-Host "Git Push Finished"
}

exit