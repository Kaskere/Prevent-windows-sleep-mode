
$TOTAL_MINUTES = (2 * 60 * 60)
$CLICK_WAIT_SECONDS = 1

echo "Toggle quit with any button to stop";

$continue = $true
while($continue)
{

    if ([console]::KeyAvailable)
    {
        echo "quit toggled";
        $x = [System.Console]::ReadKey() 
        $continue = $false

        # To-Do: fix this shizzle
        #switch ( $x.key)
        #{
        #    Esc { $continue = $false }
        #}
    } 
    else
    {
        $wsh = New-Object -ComObject WScript.Shell
        
        $wsh.SendKeys('{CAPSLOCK}')

        sleep $CLICK_WAIT_SECONDS
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wsh)| out-null
        Remove-Variable wsh

        $TOTAL_MINUTES = $TOTAL_MINUTES - $CLICK_WAIT_SECONDS 
    }

    if ($TOTAL_MINUTES -le 0)
    {
        $continue = $false
    }
}


