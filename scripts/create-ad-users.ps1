
# Import users from CSV file 
$users = Import-Csv "users.csv" foreach ($user in $users)
{
New-ADUser ` 
-Name $user.Name `
-GivenName $user.FirstName ` 
-Surname $user.LastName ` 
-Department $user.Department `
-SamAccountName $user.Username ` 
-UserPrincipalName "$($user.Username)@corp.local" ` 
-AccountPassword (ConvertTo-SecureString "P@ss1234" -AsPlainText -Force) `
-Enabled $true 
Write-Host "User created:" $user.Username 
}
