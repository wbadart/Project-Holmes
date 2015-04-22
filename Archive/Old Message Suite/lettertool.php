<!--Please visit nd.edu/~wbadart/letter for live version!!!-->

<?php

$letterTXT = $_POST["letterTXT"];
if (!isset($_POST['submit'])){

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8" />
	<title>Letter Tool</title>
    <style>
		#letter{
		}
	</style>
</head>

<body>

<table>
    	<thead>Letter Creation Assistant</thead>
    	<tr>
        	<td>
            	<form method="post" action="<?php echo $PHP_SELF;?>"> 
                	<textarea name="letterTXT" cols="20" wrap="physical"></textarea><br />
                    <input type="submit" value="submit" name="submit">
                </form>
            </td>
        </tr>
    
    
    </table>
	

<?
} else {
	$letterTXT = strtolower($letterTXT);
	echo $letterTXT, '<br />';
	$alphabet = 'abcdefghijklmnopqrstuvwxyz .,?!';
	$letterFreq = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	$letterRank = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	//etaoinshrdlcumwfgybpvkjxqz
	$desireRank = array(3, 19, 12, 10, 1, 16, 17, 8, 5, 23, 22, 11, 14, 6, 4, 20, 25, 9, 7, 2, 13, 21, 15, 24, 18, 26, 0, 0, 0, 0, 0);
	$mssgLen = strlen($letterTXT);
	echo '<br />total characters: ', $mssgLen, '<br />';
	for($i=0; $i<$mssgLen; $i+=1){
		$location = strpos($alphabet, $letterTXT[$i]);
		if($location != 26){
			//echo $location, ' ';
			$letterFreq[$location] += 1;
			//echo $letterFreq[$location], '<br />';
		}
	}
	//var_dump($letterFreq);
	
	//$letterFreq[0] -= 1;
	$orig_freq = $letterFreq;
	//var_dump($orig_freq);
	$a_ranked = false;
	for($i=1; $i<=strlen($alphabet); $i+=1){
		$maxvalue = max($letterFreq);
		
		$running = true;
		$j = 0;
  		while($running){
			if($letterFreq[$j]==$maxvalue){
				$maxindex = $j;
				$running = false;
				if(($j == 0) && !$a_ranked){
					$a_rank = $i;
					$a_ranked = true;
				}
			}
			$j += 1;
  		}
		//echo '\$maxindex: ', $maxindex, ' | \$letterFreq[here]: ', $letterFreq[$maxindex], ' ';
		$letterRank[$maxindex] = $i;
		//echo '| letterRank: ', $letterRank[$maxindex], '<br />';
		$letterFreq[$maxindex] = 0;
	}
	$letterRank[0] = $a_rank;
	//var_dump($letterRank);
	//echo 'letter, number in message, rank, desired, rank, proportion of message';
	for($i=0; $i<strlen($alphabet); $i+=1){
		echo '<p>';
		echo $alphabet[$i], ': ', $orig_freq[$i], ' occurence(s) | rank: ', $letterRank[$i], ' | desired rank: ', $desireRank[$i];
		echo '</p><br />';
	}
}
?>


</body>
</html>
