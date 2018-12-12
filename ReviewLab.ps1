$x = 1
while ($x -eq 1){
    Function FolderCreation{
        #Assumes file is in the root directory, otherwise could be made to ask for path to the file
            Set-location C:\
            $ListNames = import-csv employeelist.csv

                foreach($Name in $ListNames.name){
                    $HomeDir = read-host "Where would you like to make a folder for $Name'?"
                        New-item -type directory -name $Name -path $HomeDir

                    $Greet = read-host "Would you like to leave a welcome text file in $Name's folder? (Y/N)"
                        if($Greet -eq 'Y'){
                            New-item -type file -Value "Welcome, $Name!" -name Welcome! -path $HomeDir$Name
                        }
                }
        }

        Function ProcessKill{
            Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 5
            $killme = read-host "Enter the process ID of the process you want to kill"
            Stop-Process -Id $killme
        }

        Function PrintInfo {
            $placeholder = 'PrintInfo'
            $PrintPath = read-host 'Where do you want to save the printer file to?'
            New-item -Name $placeholder -Path $PrintPath -ItemType file
            Get-printer | ConvertTo-Json | out-file -FilePath $PrintPath$placeholder
             
            }
        
        
        
        
        $answer = read-host 'Which function would you like to use? (FolderCreation, ProcessKill, PrintInfo)'

        if($answer -eq 'FolderCreation'){
            FolderCreation
        }

            elseif($answer -eq 'ProcessKill'){
                ProcessKill
            }

            elseif($answer -eq 'PrintInfo'){
                PrintInfo
            }

                else{
                    'You did not typed the name of a function correctly.'
                }
        



}